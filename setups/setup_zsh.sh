#zsh
if [ $OSTYPE = "darwin" ]; then
	echo "Detected macos"
	brew install zsh
elif [ $OSTYPE = "linux-gnu" ]; then
	echo "Detected linux"
	sudo apt install zsh
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
