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
}

3_func () {
    echo "Setting up dotfiles"
    bash dotfile_setup.sh
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
}

echo "Choose components to be installed by comma-separating serial numbers:"
echo "1. Initial environment setup and core programs (git, vim, xclip, tmux)"
echo "2. Install zsh and oh-my-zsh"
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