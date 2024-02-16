CONFIG="$HOME/.config"
ZSH="$CONFIG/zsh"
source $ZSH/theme.zsh

# zsh plugins
if [ -d $ZSH/plugins ]; then
    source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
    source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# fzf
if [ -f $CONFIG/.fzf.zsh ]; then
    source $CONFIG/.fzf.zsh
    export FZF_DEFAULT_OPTS="
    --no-multi
    --info=inline-right
    --height 10%
    --layout=reverse
    --border=sharp
    --no-separator
    --ansi
    --prompt=file:
    "
    export FZF_DEFAULT_COMMAND="fd --type f --type l --follow --hidden"

    # ctrl + [f]ile https://github.com/sharkdp/bat
    export FZF_CTRL_T_OPTS="
    --prompt=file:
    --preview 'bat --color=always --style=numbers --line-range=:500 --style=numbers {}'
    --header '<C-x> vscode <C-y> copy <C-o> finder'
    --bind 'ctrl-x:execute(code {})+abort'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --bind 'ctrl-o:execute(open -R {})+abort'
    "
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    bindkey -r "^T"
    bindkey "^F" fzf-file-widget

    # ctrl + t (dir) can't do ctrl+d or ctrl+e
    export FZF_ALT_C_OPTS="
    --prompt=dir:
    --preview 'tree -C {}'
    --header '<C-x> vscode <C-y> copy <C-o> finder'
    --bind 'ctrl-x:execute(code {})+abort'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --bind 'ctrl-o:execute(open -R {})+abort'
    "
    export FZF_ALT_C_COMMAND="fd --type d --follow --hidden"
    bindkey "^T" fzf-cd-widget

    # ctrl + histo[r]y
    export FZF_CTRL_R_OPTS="
    --prompt=hist:
    --header '<C-y> copy <C-r> sort <C-h> history'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --bind 'ctrl-r:toggle-sort'
    --bind 'ctrl-h:execute(code "$HOME/.zsh_history")+abort'
    --layout=default
    "
    # bind up arrow key to fzf history widget
    bindkey -r "^R"
    # bindkey "^[OA" fzf-history-widget
    bindkey "^[[A" fzf-history-widget
fi

# eza https://gist.github.com/eggbean/74db77c4f6404dd1f975bd6f048b86f8#file-eza-wrapper-sh
[ -f $CONFIG/eza/eza-wrapper.sh ] && alias ls="$CONFIG/eza/eza-wrapper.sh"

# ripgrep
if [ -f $CONFIG/.ripgreprc ]; then
    export RIPGREP_CONFIG_PATH="$CONFIG/.ripgreprc"

    # fzf with ripgrep https://github.com/junegunn/fzf/issues/2789 https://news.ycombinator.com/item?id=38471822
    function rgg {
        result=$(rg "$@" | fzf --delimiter ':' --prompt="grep ("$@")": --header '<Enter> vscode')
        file=${result%%:*}
        linenumber=$(echo "${result}" | cut -d: -f2)
        code -g "$file:$linenumber"
    }
fi

# bat
if command -v bat >/dev/null 2>&1; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    alias cat=bat
fi

# zellij
if command -v zellij >/dev/null 2>&1; then
    function zz() {
        # default to 'dev' session
        if [ -z "$1" ]; then
            zellij a dev
        else
            zellij -s "$1"
        fi
    }
    alias zr='zellij run -f -- '
fi

# yadm
if command -v yadm >/dev/null 2>&1; then
    alias y='yadm'
    alias ys='y status'
    alias yd='y diff'
    alias yp='y pull'
    function yy() {
        yadm pull
        yadm add -u
        yadm status
        echo "enter commit message:"
        read commit_msg
        yadm commit -m "$commit_msg" && yadm push
    }
fi
