if [[ $OSTYPE = "darwin"* ]]; then 
echo "Detected macos"
        curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
	bash Miniconda3-latest-MacOSX-x86_64.sh -b -p ${HOME}/miniconda
elif [ $OSTYPE = "linux-gnu" ]; then
	echo "Detected linux"
	curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	bash Miniconda3-latest-Linux-x86_64.sh -b -p ${HOME}/miniconda
fi
rm Miniconda3-latest-Linux-x86_64.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cat ${DIR}/assets/condaondemand.sh >> ~/.bashrc
if [[ -e ~/.zshrc ]]; then
    cat ${DIR}/assets/condaondemand.sh >> ~/.zshrc
fi
echo "Conda has been installed. It is disabled by default. To activate it in a terminal session, type "dl". You can configure this in the bashrc or zshrc file."
