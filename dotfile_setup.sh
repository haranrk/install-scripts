ln -f dotfiles/tmux.conf ~/.tmux.conf
echo "Hard-linked tmux.conf"
ln -f dotfiles/vimrc ~/.vimrc
echo "Hard-linked vimrc"
ln -f dotfiles/neovim_config ~/.config/nvim/init.vim
echo "Hard-linked neovim config "

if [[ -e ~/.zshrc ]]; then
	    ln -f dotfiles/zsh_profile ~/.zsh_profile
	    if [[ -z $(cat ~/.zshrc | grep "source ~/.zsh_profile") ]]; then
		echo "source ~/.zsh_profile" >> ~/.zshrc
	    fi
	    echo "Hard-linked zsh_profile and configured zshrc to source it"
	    echo "Restart the terminal for changes to take effect"
    else
	    ln -f dotfiles/bash_profile ~/.bash_profile
	    if [[ -z $(cat ~/.bashrc | grep "source ~/.bash_profile") ]]; then
		echo "source ~/.bash_profile" >> ~/.bashrc
	    fi
	    echo "Hard-linked bash_profile and configured bashrc to source it"
	    echo "Restart the terminal for changes to take effect"
fi

if [ $(uname -s) = "Darwin" ]; then
    echo "Detected linux"

    mkdir -p ~/.dir_colors/dircolors
    ln -f  dotfiles/dircolors ~/.dir_colors/dircolors
    echo "Hard-linked dircolors"
    
    mkdir -p ~/.config/terminator
    ln -f  dotfiles/terminator_config ~/.config/terminator/config
    echo "Hard-linked terminator config"
elif [ $(uname -s) = "Darwin" ]; then
    echo "Detected macOS"
    ln -f dotfiles/chunkwmrc ~/.chunkwmrc
    ln -f dotfiles/chunkwmrc ~/.chunkwmrc
    echo "Hard-linked chunkwmrc and skhdrc"
else 
    echo $OSTYPE
    echo "OS not recognized"
fi

