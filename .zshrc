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

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jshu"
# ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(zsh-autosuggestions fast-syntax-highlighting)
zstyle ':omz:update' mode reminder # just remind me to update when it's time
source $ZSH/oh-my-zsh.sh

# fzf + fd
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# eza https://gist.github.com/eggbean/74db77c4f6404dd1f975bd6f048b86f8#file-eza-wrapper-sh
if (($ + commands[exa])); then
  alias ls="$HOME/.config/eza/eza-wrapper.sh"
else
  alias ls="command ls $LS_OPTIONS"
fi

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi
