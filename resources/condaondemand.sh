function activate_conda {
        export PATH="~/miniconda/bin:$PATH"
        . ~/miniconda/etc/profile.d/conda.sh
        echo "Conda activated"
}
function haran_conda {
        activate_conda
        conda activate dl
}
alias dl=haran_conda

