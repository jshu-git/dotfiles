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
  --no-separator \
  --ansi
"
# https://github.com/catppuccin/fzf
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_DEFAULT_COMMAND="fd --type f --type l --follow --hidden"

# ctrl + [f]ile
# export FZF_CTRL_T_OPTS="
# --prompt=file:
# --preview 'bat --color=always --style=numbers --line-range=:500 --style=numbers {}'
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
  --prompt=''
  --bind 'ctrl-x:execute(clear)+abort'
  --layout=default
"
# bind up arrow key to fzf history widget instead of C-r
bindkey -r "^R"
bindkey "^[[A" fzf-history-widget
