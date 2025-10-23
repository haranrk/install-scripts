# Helper Function Inclusion Plan

## Approach 1: Central Helpers Script Sourced by All Shell Profiles
- **Overview:** Create a new script (e.g., `dotfiles/.config/helpers/common_helpers.sh`) that defines helper functions such as `open_current_pr`. Source this script from both `zsh_profile` and `bash_profile`.
- **Steps:**
  1. Add the helper script under `dotfiles/.config/helpers/` and define functions there.
  2. Update `dotfiles/zsh_profile` and `dotfiles/bash_profile` to source the script (e.g., `source "$HOME/.config/helpers/common_helpers.sh"`).
  3. Ensure `setup_dotfiles` links the helper directory or copies it alongside other config files.
- **Pros:** Single source of truth; easy to extend for new helpers; consistent behavior across shells.
- **Cons:** Requires ensuring the helper script is distributed/linked on all machines; adds another file to manage in dotfiles syncing.

## Approach 2: Append Helpers Directly in Existing Profile Files
- **Overview:** Define helper functions directly inside `dotfiles/zsh_profile` and `dotfiles/bash_profile`, possibly in a dedicated section.
- **Steps:**
  1. Add a clearly labeled section (e.g., `# Helper functions`) to both profile files.
  2. Insert shared functions in both files (or conditionally load if shell-specific).
  3. Re-run `./setup_dotfiles` to propagate the updates.
- **Pros:** Simple setup; no additional sourcing or file creation; aligns with current dotfile layout.
- **Cons:** Duplicates logic across files; harder to maintain if many helpers are added; increases profile file size.

## Approach 3: Shell-agnostic Helper Directory with Autoloading
- **Overview:** Create a `helpers.d/` directory where each helper lives in its own file. Profiles iterate through the directory and source each helper dynamically.
- **Steps:**
  1. Create `dotfiles/helpers.d/` and add helper files (e.g., `open_pr.sh` defining the function).
  2. Modify `zsh_profile` and `bash_profile` to source all readable files in the directory: `for helper in "$HOME/.helpers.d/"*.sh; do source "$helper"; done`.
  3. Update `setup_dotfiles` to copy or link `helpers.d/` to `$HOME/.helpers.d/`.
- **Pros:** Highly modular; easy to enable/disable individual helpers; scalable for future additions.
- **Cons:** Slightly more complex logic; requires directory management and consistent naming; shell startup may be marginally slower if many files exist.
