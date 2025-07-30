# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a collection of Unix installation scripts and dotfiles for setting up a development environment across macOS and Linux systems. The repository provides modular installation scripts for various tools and automatic dotfile management.

## Key Architecture Components

### Main Entry Points
- `./setup` - Interactive menu-driven installer with 8 different component categories
- `./setup_dotfiles` - Force hard-links dotfiles to appropriate system locations

### Modular Setup System
The `setups/` directory contains specialized installation scripts:
- Cross-platform detection using `$OSTYPE` variable (darwin* for macOS, linux-gnu for Linux)
- Each script handles both macOS (Homebrew) and Linux (apt) package management
- Asset files in `setups/assets/` provide configuration snippets that get appended to shell configs

### Dotfile Management
- Dotfiles stored in `dotfiles/` directory with OS-specific conditional linking
- Hard-linking strategy used to keep dotfiles in sync with repository
- Shell profile detection: uses zsh_profile if zsh exists, otherwise bash_profile
- Automatic sourcing configuration added to existing shell rc files

## Common Commands

Run the main interactive installer:
```bash
./setup
```

Install specific components (comma-separated):
```bash
# Example: Install core tools, zsh, and dotfiles
echo "1,2,3" | ./setup
```

Setup only dotfiles:
```bash
./setup_dotfiles
```

Run individual setup scripts:
```bash
bash setups/setup_zsh.sh
bash setups/setup_python.sh
bash setups/setup_git.sh
```

## Development Notes

- Git setup script (`setups/setup_git.sh`) prompts for GitHub credentials and generates SSH keys
- Python setup installs Miniconda with conda-on-demand activation (type `dl` to activate)
- Tmux and Vim plugin installation handled separately through dedicated functions
- The setup system is designed to be idempotent - running scripts multiple times should be safe