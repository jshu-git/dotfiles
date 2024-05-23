# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
# https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY         # append to history file
setopt HIST_NO_STORE          # Don't store history commands

# https://superuser.com/questions/148207/how-can-i-make-zsh-completion-behave-like-bash-completion
# setopt noautomenu

# completions
setopt globdots
autoload -Uz compinit
compinit

# macos arrow keys https://linux.die.net/man/1/zshzle
bindkey "^[[1;3C" forward-word          # Alt-right
bindkey "^[[1;3D" backward-word         # Alt-left
bindkey "^[[1;9D" beginning-of-line     # Cmd-left
bindkey "^[[1;9C" end-of-line           # Cmd-right
# bindkey "^[[Z"    reverse-menu-complete # Shift-Tab
bindkey "^Z"      undo
bindkey "^Y"      redo

# brew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

CONFIG="$HOME/.config"

# plugin manager (antidote)
ZSH="$CONFIG/zsh"
source $ZSH/antidote/antidote.zsh
antidote load $ZSH/plugins.txt
[ -f $ZSH/aliases.zsh ] && source $ZSH/aliases.zsh

# eza https://github.com/eza-community/eza?tab=readme-ov-file
if command -v eza > /dev/null 2>&1; then
    EZA_OPTIONS="--classify=auto --color=auto --icons=auto"
    EZA_LONG_OPTIONS="$EZA_OPTIONS --long --sort=modified --reverse --header --time-style='+%Y %e %b %R' --total-size --octal-permissions"
    alias l="eza $EZA_OPTIONS"
    alias ll="eza $EZA_LONG_OPTIONS"
    alias llt="eza  $EZA_LONG_OPTIONS --tree --level=2"
fi

# fzf
# if command -v fzf >/dev/null 2>&1; then
#     [ -f $CONFIG/fzf/.fzf.zsh ] && source "$CONFIG/fzf/.fzf.zsh"
# fi

# zoxide
if command -v zoxide > /dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# zellij
if command -v zellij >/dev/null 2>&1; then
    function zz() {
        # default to 'dev' session
        if [ -z "$1" ]; then
            zellij a dev
            # $HOME/.cargo/bin/zellij a dev
        else
            zellij -s "$1"
            # $HOME/.cargo/bin/zellij -s "$1"
        fi
    }
fi

# bat
if command -v bat >/dev/null 2>&1; then
    alias cat=bat
fi

# starship
if command -v starship >/dev/null 2>&1; then
    # https://github.com/spaceship-prompt/spaceship-prompt/issues/462
    precmd() { precmd() { echo } }
    eval "$(starship init zsh)"
fi

# neovim
if command -v nvim >/dev/null 2>&1; then
    alias vim="nvim"
    alias vi="nvim"
    alias v="nvim"
    # export EDITOR=nvim
fi

# lazygit
if command -v lazygit >/dev/null 2>&1; then
    alias gg=lazygit

    # yadm
    if command -v yadm >/dev/null 2>&1; then
        alias yy='cd ; yadm enter lazygit ; cd -'
    fi
fi
