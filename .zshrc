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
export ZSH="$HOME/.config/zsh"
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/theme.zsh

# fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# eza https://gist.github.com/eggbean/74db77c4f6404dd1f975bd6f048b86f8#file-eza-wrapper-sh
[ -f $HOME/.config/eza/eza-wrapper.sh ] && alias ls="$HOME/.config/eza/eza-wrapper.sh"

# ripgrep
[ -f $HOME/.ripgreprc ] && export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi
