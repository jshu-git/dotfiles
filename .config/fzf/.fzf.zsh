# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# https://www.mankier.com/1/fzf#Options-Interface
export FZF_DEFAULT_OPTS="--no-multi --info=inline-right --border=sharp --bind 'tab:toggle-down,btab:toggle-up'"
# --layout=reverse \
FD_EXCLUDE="--exclude .git --exclude .cache --exclude .vscode --exclude .cargo --exclude .DS_\* --exclude .rustup --exclude .npm"
export FZF_DEFAULT_COMMAND="fd --type f --type l --follow --hidden $FD_EXCLUDE"

# bind up arrow key to fzf history widget instead of C-r
export FZF_CTRL_R_OPTS="--bind 'tab:toggle-up,btab:toggle-down'"
bindkey "^[[A" fzf-history-widget

# fzf-tab-completion
if [ -d $HOME/.config/fzf/fzf-tab-completion ]; then
    source $HOME/.config/fzf/fzf-tab-completion/zsh/fzf-zsh-completion.sh
fi
