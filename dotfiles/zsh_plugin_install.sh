bundle() {
	IFS="/"
	read -ra STR <<< "$1" 
	IFS=" "
	git clone https://github.com/${STR[0]}/${STR[1]} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/${STR[1]}
}

bundle 'zsh-users/zsh-autosuggestions'
bundle 'zsh-users/zsh-syntax-highlighting' 
bundle 'MichaelAquilina/zsh-you-should-use'
mv ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-you-should-use ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/you-should-use
bundle 'oldratlee/hacker-quotes'

