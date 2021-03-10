#zsh
if [[ $OSTYPE = "darwin"* ]]; then
	echo "Detected macos"
	# brew install zsh
elif [ $OSTYPE = "linux-gnu" ]; then
	echo "Detected linux"
	sudo apt install zsh
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
bash ./setups/zsh_plugin_install.sh

