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

FD_EXCLUDE_OPTS="--exclude node_modules --exclude .git --exclude .venv --exclude .DS_Store --exclude .gitignore --exclude .github"
FD_OPTS="--follow --hidden"

# export FZF_TMUX_OPTS='-p' # preview in tmux
export FZF_DEFAULT_OPTS="--multi --info=right --height 20% --layout=reverse --border=sharp --no-separator"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTS $FD_EXCLUDE_OPTS"

# ctrl + [f]ile
export FZF_CTRL_T_OPTS="--prompt=file:"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey -r "^T"
bindkey "^F" fzf-file-widget

# ctrl + [t]ree (dir) can't do ctrl+e because that's command+right arrow
export FZF_ALT_C_OPTS="--prompt=dir: --preview 'tree -C {}'"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS $FD_EXCLUDE_OPTS"
bindkey "^T" fzf-cd-widget

# ctrl + histo[r]y
export FZF_CTRL_R_OPTS="--prompt=hist:"
