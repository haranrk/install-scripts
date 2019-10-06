#These functions load conda whenever their run. Therefore, by defualt only the system python would be active
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

