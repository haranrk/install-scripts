ln -f dotfiles/tmux.conf ~/.tmux.conf
echo "Hard-linked tmux.conf"
tmux source-file ~/.tmux.conf
ln -f dotfiles/vimrc ~/.vimrc
echo "Hard-linked vimrc"

if [[ $SHELL =~ .*zsh ]]; then
    ln -f dotfiles/zsh_profile ~/.zsh_profile
    if [[ -z $(cat ~/.zshrc | grep "source ~/.zsh_profile") ]]; then
        echo "source ~/.zsh_profile" >> ~/.zshrc
    fi
    echo "Hard-linked zsh_profile and configured zshrc to source it"
    source ~/.zshrc
fi

if [ $OSTYPE = "linux-gnu" ]; then
    echo "Detected linux"

    mkdir -p ~/.dir_colors/dircolors
    ln -f  dotfiles/dircolors ~/.dir_colors/dircolors
    echo "Hard-linked dircolors"
    
    mkdir -p ~/.config/terminator
    ln -f  dotfiles/terminator_config ~/.config/terminator/config
    echo "Hard-linked terminator config"
elif [ $OSTYPE = "darwin18.0" ]; then
    echo "Detected macOS"
    ln -i dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
    echo "Hard-linked alacritty config"
fi

