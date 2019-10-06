omz_bundle() {
	IFS="/"
	read -ra STR <<< "$1" 
	IFS=" "
	git clone https://github.com/${STR[0]}/${STR[1]} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/${STR[1]}
}

omz_bundle 'zsh-users/zsh-autosuggestions'
omz_bundle 'zdharma/fast-syntax-highlighting'
omz_bundle 'Valiev/almostontop'
omz_bundle 'esc/conda-zsh-completion'

