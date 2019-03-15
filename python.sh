if [ $OSTYPE = "darwin" ]; then 
echo "Detected macos"
	curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
	bash Miniconda3-latest-MacOSX-x86_64.sh
elif [ $OSTYPE = "linux-gnu" ]; then
	echo "Detected linux"
	curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	bash Miniconda3-latest-Linux-x86_64.sh
fi
