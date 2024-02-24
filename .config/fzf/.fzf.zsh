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
export FZF_DEFAULT_OPTS="--no-multi \
  --info=inline-right \
  --height 10% \
  --layout=reverse \
  --border=sharp \
  --bind 'tab:toggle-down,btab:toggle-up'
"
FD_EXCLUDE="--exclude .git --exclude .cache --exclude .vscode --exclude .cargo --exclude .DS_* --exclude .rustup"
export FZF_DEFAULT_COMMAND="fd --type f --type l --follow --hidden $FD_EXCLUDE"

# ctrl + [f]ile
# export FZF_CTRL_T_OPTS="
# --prompt=file:
# --preview 'cat --color=always --style=numbers --line-range=:500 --style=numbers {}'
# --header '<C-x> hx'
# --bind 'ctrl-x:execute(hx {})+abort'
# "
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# bindkey -r "^T"
# bindkey "^F" fzf-file-widget
# 
# # ctrl + t (dir) can't do ctrl+d or ctrl+e
# export FZF_ALT_C_OPTS="
# --prompt=dir:
# --preview 'tree -C {}'
# --header '<C-x> hx'
# --bind 'ctrl-x:execute(hx {})+abort'
# "
# export FZF_ALT_C_COMMAND="fd --type d --follow --hidden"
# bindkey -r "^E"
# bindkey "^E" fzf-cd-widget

# ctrl + histo[r]y
export FZF_CTRL_R_OPTS="
  --layout=default
"
# bind up arrow key to fzf history widget instead of C-r
bindkey -r "^R"
bindkey "^[[A" fzf-history-widget
