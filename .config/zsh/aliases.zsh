alias sz='exec zsh'

# python
alias python='python3'
alias act='source .venv/bin/activate'

# paths
alias h='cd ~ && ls'
alias desk='cd ~/Desktop && ls'
alias g='cd ~/git && ls'
alias ppwd='pwd -P'
alias ..='cd ..'
alias ...='cd ../..'
alias drop='cd ~/Library/CloudStorage/Dropbox/ && ls'

alias mnt='mount | sort | grep -E ^/dev | column -t'
alias path='echo -e ${PATH//:/\\n} | sort'
alias env="env | sort | awk -F= '{printf \"%-30s %s\n\", \$1, \$2}'"
alias clear='printf "\033c"'

# cd
function d() {
	if [ -z "$1" ]; then
		cd .. && ls
	else
		cd "$1" && ls
	fi
}
