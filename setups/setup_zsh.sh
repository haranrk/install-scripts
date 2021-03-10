#zsh
if [[ $OSTYPE = "darwin"* ]]; then
	echo "Detected macos"
	# brew install zsh
elif [ $OSTYPE = "linux-gnu" ]; then
	echo "Detected linux"
	sudo apt install zsh
fi


#Create zshrc if it does not exist 
if [[ ! -e ~/.zshrc ]]; then
	echo "Zshrc not present, creating it"
	touch ~/.zshrc
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cat ${DIR}/assets/zshrc_init.sh >> ~/.zshrc 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
if [[ $OSTYPE = "darwin"* ]]; then
	echo "Detected macos, running compaudit"
	compaudit | xargs chmod g-w,o-w	
fi
bash ./setups/zsh_plugin_install.sh

