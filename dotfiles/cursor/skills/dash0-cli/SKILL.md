---
name: dash0-cli
description: Query Dash0 logs from the CLI, manage profiles, and export CSVs with campaign/message fields. Use when users ask for Dash0 CLI commands, filters, profile selection, log export, or grouped campaign summaries.
---

# Dash0 CLI

Use this skill when interacting with Dash0 from the terminal.

## Quick Start

1. Check current profile, API URL, and dataset:
   ```bash
   dash0 config show
   ```
2. If needed, switch profile:
   ```bash
   dash0 config profiles list
   dash0 config profiles select prod
   ```
3. Query logs with experimental flag:
   ```bash
   dash0 logs query -X --from now-1h --to now
   ```

## Query Syntax

- `--filter` is repeatable.
- Filter format is `key operator value` (not `=`).
- Common operator: `is`
- Example:
  ```bash
  dash0 logs query -X \
    --filter "service.name is lhgo" \
    --filter "otel.log.body is campaign.decide.outcome" \
    --from now-7d --to now
  ```

## Export CSV

Use explicit columns so exported files are stable:

```bash
dash0 logs query -X \
  --from now-7d --to now \
  --filter "service.name is lhgo" \
  --filter "otel.log.body is campaign.decide.outcome" \
  --filter "reason is label_mismatch_disabled" \
  --column time \
  --column severity \
  --column service.name \
  --column body \
  --column reason \
  --column campaign_id \
  --column message_id \
  -o csv --limit 5000 > docs/export.csv
```

## Important Notes

- Dataset names are case-sensitive. Example: `default` and `Default` can behave differently.
- If a query fails with `403 access denied`, check profile/dataset with `dash0 config show`.
- `--column` and `--filter` can both be passed multiple times.
- Aliases are supported for columns: `time`, `severity`, `body`, etc.

## Group-By Workaround

`dash0 logs query` does not provide SQL-style `GROUP BY`, so export first, then aggregate locally.

Group by `campaign_id`, include count and list of message ids, sorted by count descending:

```bash
awk -F',' '
NR==1 {
  for (i=1; i<=NF; i++) idx[$i]=i
  cid=idx["campaign_id"]; mid=idx["message_id"]
  if (!cid || !mid) {
    print "Missing campaign_id or message_id column" > "/dev/stderr"
    exit 1
  }
  next
}
{
  c=$cid; m=$mid
  if (c=="") next
  cnt[c]++
  if (msgs[c]=="") msgs[c]=m
  else msgs[c]=msgs[c]"|"m
}
END {
  for (c in cnt) print c "," cnt[c] "," msgs[c]
}
' docs/export.csv \
| sort -t, -k2,2nr \
| awk 'BEGIN { print "campaign_id,count,message_ids" } { print }' \
> docs/export_by_campaign.csv
```

Add URL column:

```bash
awk -F',' 'BEGIN {OFS=","} NR==1 {print $0,"campaign_url"; next} {print $0,"http://campaign-console.tailac0440.ts.net/campaigns/"$1}' \
  docs/export_by_campaign.csv > docs/export_by_campaign.tmp.csv \
  && mv docs/export_by_campaign.tmp.csv docs/export_by_campaign.csv
```

## Response Style

When returning commands to users:

1. Give a copy/paste command first.
2. Include any assumptions (profile, dataset, time range).
3. If grouping is requested, provide both:
   - raw Dash0 query command
   - local aggregation command
