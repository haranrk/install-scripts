ln -i tmux.conf ~/.tmux.conf
ln -i vimrc ~/.vimrc

ln -i zsh_profile ~/.zsh_profile
if [[ -z $(cat ~/.zshrc | grep "source ~/.zsh_profile") ]]; then
	echo "source ~/.zsh_profile" >> ~/.zshrc
fi

if [ $OSTYPE = "linux-gnu" ]; then
    echo "Detected linux"
    ln -i  dircolors ~/.dir_colors/dircolors
    ln -i  terminator_config ~/.config/terminator/config
elif [ $OSTYPE = "darwin18.0" ]; then
    echo "Detected macOS"
    ln -i alacritty.yml ~/.config/alacritty/alacritty.yml
fi
