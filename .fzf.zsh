# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/usr/local/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

FD_EXCLUDE_OPTS="--exclude node_modules --exclude .git --exclude .venv --exclude .DS_Store --exclude .gitignore --exclude .github"
FD_OPTS="--follow --hidden"
export FZF_DEFAULT_OPTS="--multi --info=right --height 20% --layout=reverse --border=sharp --no-separator"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTS $FD_EXCLUDE_OPTS"
# ctrl + f (file)
export FZF_CTRL_T_OPTS="--prompt=file:"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey '^F' fzf-file-widget
# ctrl + e (dir)
export FZF_ALT_C_OPTS="--prompt=dir:"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS $FD_EXCLUDE_OPTS"
bindkey "^E" fzf-cd-widget
# ctrl + r (history)
export FZF_CTRL_R_OPTS="--prompt=hist:"
