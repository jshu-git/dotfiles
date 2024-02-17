alias sz='exec zsh'

# python
alias python='python3'
alias act='source .venv/bin/activate'

# paths
alias h='cd ~ && ls'
alias desk='cd ~/Desktop && ls'
alias g='cd ~/git && ls'

alias mnt='mount | grep -E ^/dev | column -t'
alias path='echo -e ${PATH//:/\\n}'
alias env="env | sort | awk -F= '{printf \"%-30s %s\n\", \$1, \$2}'"
alias clear='printf "\033c"'

# ls
alias l='ls'
# [l]ong [A]lmost all [o]ctal [t]ime modified
alias ll='ls -lAot'
# [T]ree [L]evel
alias llt='ll -T -L'
# cd
function d() {
    if [ -z "$1" ]; then
        cd .. && ls
    else
        cd "$1" && ls
    fi
}
function dd() {
    if [ -z "$1" ]; then
        cd .. && ll
    else
        cd "$1" && ll
    fi
}

