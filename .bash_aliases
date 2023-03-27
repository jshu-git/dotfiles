# apt
alias apt-upgrade='sudo apt update && sudo apt dist-upgrade && sudo apt autoremove'
alias apti='sudo apt install'

# python
alias py='python'
alias python='python3.11'
alias pipu="pip freeze | cut -d'=' -f1 | xargs -n1 pip install -U"
alias req='pip freeze > requirements.txt'
alias act='source .venv/bin/activate'

# vim/bash
alias v='vim'
alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias vimrc='vi ~/.vimrc'
alias tmrc='vi ~/.tmux.conf'

# tm
alias tm='tmux'
alias a='attach'
alias tmk='tmkill'

# new named session
new() {
    if [ "$#" -eq 0 ]; then
        echo 'no arguments provided'
    else
        tm new -s "$1"
    fi
}

# attach session
attach() {
    if [ "$#" -eq 0 ]; then
        echo 'no arguments provided'
    else
        tm attach -t "$1"
    fi
}

# kill session
tmkill() {
    if [ "$#" -eq 0 ]; then
        echo 'no arguments provided'
    else
        tmux kill-session -t "$1"
    fi
}

# nav
alias ll='func_ll'
alias cc='func_cc'
alias h='cc ~'
alias desk='cc /mnt/c/Users/jshu/Desktop'
alias g='cc ~/git/'
alias mnt='mount | grep -E ^/dev | column -t'
alias path='echo -e ${PATH//:/\\n}'
alias grh='history | grep'

# recursive grep
gr() {
    if [ "$#" -eq 0 ]; then
        echo 'provide a string(s) to grep'
    else
        # ignore files/directories starting with . and binary files
        find . -type f -not -path '*/\.*' -exec grep -n -I -i --color=auto "$*" {} +
    fi
}

func_cc() {
    if [ "$#" -eq 0 ]; then
        cd .. && ll
    else
        cd "$@" && ll
    fi
}

func_ll() {
    if [ "$#" -eq 0 ]; then
        ls -alth --color=tty && pwd
    else
        ls -alth --color=tty "$@"
    fi
}
