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

FD_OPTS="--follow --hidden"
export FZF_DEFAULT_OPTS="--multi --info=inline-right --height 20% --layout=reverse --border=sharp --no-separator"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTS"

# ctrl + [f]ile
export FZF_CTRL_T_OPTS="
  --prompt=file:
  --preview 'bat {}'
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
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS"
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
# bindkey "^[OA" fzf-history-widget
bindkey "^[[A" fzf-history-widget
