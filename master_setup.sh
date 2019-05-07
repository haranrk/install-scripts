#! /bin/bash
1_func () {
    echo "Installing git, vim, xclip and tmux"
    if [ $OSTYPE = "darwin" ]; then
        echo "Detected macOS"
        #TODO
    elif [ $OSTYPE = "linux-gnu" ]; then
        echo "Detected linux"
        sudo apt install git vim xclip tmux curl
        bash setups/setup_git.sh
    fi

    echo "Installing Roboto Mono Nerd font"
    if [ $OSTYPE = "linux-gnu" ]; then
        echo "Detected linux"
        mkdir -p ~/.local/share/fonts
        cd ~/.local/share/fonts 
        curl -fLo "Roboto Mono Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf 
        curl -fLo "Roboto Mono Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
        cd -
        echo "Running fc-cache to recache fonts"
        fc-cache -vf

    elif [ $OSTYPE = "darwin18.0" ]; then
        echo "Detected macOS"
        brew cask install font-robotomono-nerd-font-mono font-robotomono-nerd-font
    fi

}

3_func () {
    echo "Setting up dotfiles"
    zsh dotfile_setup.sh
}

4_func () {
    bash setups/setup_python.sh
}

5_func () {
    echo "Installing tmux plugins"
    if [ ! -d ~/.tmux/plugins/tpm ]; then 
    echo Cloning tmux plugin manager repository
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
}

6_func () {
    echo "Installing vim plugins"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
}

2_func () {
    echo "Installing zsh and oh-my-zsh"
    bash setups/setup_zsh.sh
    
    echo "Installing powerlevel9k"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
}

echo "Choose components to be installed by comma-separating serial numbers:"
echo "1. Initial environment setup and core programs (git, vim, xclip, tmux, nerd-font)"
echo "2. Install zsh, oh-my-zsh, nerd-font and powerlevel9k zsh theme"
echo "3. Setup dotfiles"
echo "4. Install python (conda)"
echo "5. Install tmux plugins"
echo "6. Install vim plugins"
echo "7. Install auxillary programs"
read tasks
tasks=$(echo $tasks | tr "," "\n")

for task in $tasks
do 
${task}_func
done
