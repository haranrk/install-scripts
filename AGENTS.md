# Repository Guidelines

## Project Structure & Module Organization
Runbook automation starts in `./setup`, an interactive Bash menu that calls numbered helper functions. Modular installers live under `setups/` (e.g., `setups/setup_zsh.sh`, `setups/setup_python.sh`) with shared snippets in `setups/assets/`. Dotfiles and application preferences sit in `dotfiles/`; `./setup_dotfiles` hard-links them into the home directory and applies MailMate/iTerm2 profiles on macOS. Reference scripts, Brewfiles, and legacy notes are stored in `resources/` and `resources/archive/`.

## Build, Test, and Development Commands
Run `./setup` from the repository root to launch the menu; call individual stages with `bash setups/<module>.sh` while developing. Execute `./setup_dotfiles` after editing anything in `dotfiles/` to refresh links. Override `OSTYPE` (e.g., `OSTYPE=darwin ./setup`) when you need to exercise a platform-specific branch. Use `bash -x setup` to trace commands during troubleshooting.

## Coding Style & Naming Conventions
Scripts should target Bash, include `#!/usr/bin/env bash`, and enable `set -euo pipefail`. Add `IFS=$'\n\t'` when parsing user input and quote command substitutions. Prefer descriptive snake_case functions unless a menu index is required, and keep filenames in `setups/` lowercase with underscores (`setup_latest_tmux.sh` sets the precedent). Favor long-form flags, check exit codes, and leave a short comment above any external download noting its origin or version pin.

## Testing Guidelines
There is no automated suite, so rely on command-level checks. Run `shellcheck path/to/script.sh` and `bash -n path/to/script.sh` before committing. Validate critical flows on both macOS and Linux (or WSL) because `OSTYPE` gates many branches. When editing dotfile linkage logic, execute `HOME=$(mktemp -d) ./setup_dotfiles` so you can inspect the results without touching your real home directory.

## Security & Configuration Tips
Do not commit credentials or machine-specific keys—`setups/setup_git.sh` already prompts interactively. Favor HTTPS downloads, pin specific versions, and document any manual follow-up steps. Place bulky or binary assets in `resources/archive/` with a brief note on provenance so contributors can audit them later.
