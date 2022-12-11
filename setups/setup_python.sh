if [[ $OSTYPE = "darwin"* ]]; then 
echo "Detected macos"
	curl -o miniconda-installer.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
elif [ $OSTYPE = "linux-gnu" ]; then
	echo "Detected linux"
	curl -o miniconda-installer.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
bash miniconda-installer.sh -b -p ${HOME}/miniconda
rm miniconda-installer.sh
echo "Conda installed"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cat ${DIR}/assets/condaondemand.sh >> ~/.bashrc
if [[ -e ~/.zshrc ]]; then
    cat ${DIR}/assets/condaondemand.sh >> ~/.zshrc
fi

source ${DIR}/assets/condaondemand.sh
activate_conda
conda create -y --name dl python=3
echo "Conda has been installed. It is disabled by default. To activate it in a terminal session, type 'dl'. You can configure this in the bashrc or zshrc file."
