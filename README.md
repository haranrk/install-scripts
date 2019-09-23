# Unix installation scripts
Scripts that install various software and config files

## Setup
This script installs various programs. Run it with the following command.
```bash
./setup
```
Upon running the above script, you will be presented with an interactive menu to choose the subsections of software that you want to install.

## Dotfile setup
This script force hard-links all the dotfiles from present in the dotfile directory, to their appropriate locations in the unix system. If zsh is installed it installs zsh_profile otherwise the bash_profile.
