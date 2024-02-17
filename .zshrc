# history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.

# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
KEYTIMEOUT=1

# https://superuser.com/questions/148207/how-can-i-make-zsh-completion-behave-like-bash-completion
setopt noautomenu

# completions
autoload -Uz compinit
compinit
compdef _gnu_generic fzf

# macos arrow keys https://linux.die.net/man/1/zshzle
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;9D" beginning-of-line
bindkey "^[[1;9C" end-of-line
bindkey "^Z"      undo
bindkey "^Y"      redo

# brew
export PATH=/opt/homebrew/bin:$PATH

CONFIG="$HOME/.config"
ZSH="$CONFIG/zsh"
# zoxide needs to run first since it replaces cd
if command -v zoxide > /dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"
fi
[ -f $ZSH/aliases.zsh ] && source $ZSH/aliases.zsh
[ -f $ZSH/plugins.zsh ] && source $ZSH/plugins.zsh

