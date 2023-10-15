# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode reminder # just remind me to update when it's time
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(zsh-autosuggestions fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf + fd
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FD_EXCLUDE_OPTS="--exclude node_modules --exclude .git --exclude .venv --exclude .DS_Store --exclude .gitignore --exclude .github"
FD_OPTS="--follow --hidden"
export FZF_DEFAULT_OPTS="--multi --info=right --height 20% --layout=reverse --border=sharp --no-separator --prompt=fzf:"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTS $FD_EXCLUDE_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS $FD_EXCLUDE_OPTS"
# zsh + fzf + alacritty:
bindkey "ç" fzf-cd-widget