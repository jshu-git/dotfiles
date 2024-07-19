# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
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

# emacs
bindkey -e
# macos arrow keys https://linux.die.net/man/1/zshzle
bindkey "^[[1;3C" forward-word      # alt-right
bindkey "^[[1;3D" backward-word     # alt-left
bindkey "^[[1;9D" beginning-of-line # cmd-left
bindkey "^[[1;9C" end-of-line       # cmd-right

# edit command line
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# brew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

CONFIG="$HOME/.config"

# zsh
ZSH="$CONFIG/zsh"
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[l' autosuggest-accept
source $ZSH/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_HIGHLIGHT_BACKGROUND=#4C566A
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# completions
autoload -Uz compinit && compinit

# eza https://github.com/eza-community/eza?tab=readme-ov-file
if command -v eza >/dev/null 2>&1; then
	EZA_OPTIONS="--color=auto --icons=auto --all"
	EZA_LONG_OPTIONS="$EZA_OPTIONS --long --sort=modified --reverse --header --time-style='+%Y %b %e %R ' --octal-permissions --no-permissions"
	alias l=/bin/ls
	alias ls="eza $EZA_OPTIONS"
	alias ll="eza $EZA_LONG_OPTIONS"
	alias llt="eza $EZA_LONG_OPTIONS --tree --level=2"
	alias lls="eza $EZA_LONG_OPTIONS --total-size"
fi

# aliases after eza since eza overrides ls
source $ZSH/aliases.zsh

# fzf
if command -v fzf >/dev/null 2>&1; then
	[ -f $CONFIG/fzf/.fzf.zsh ] && source "$CONFIG/fzf/.fzf.zsh"
fi

# zellij
if command -v zellij >/dev/null 2>&1; then
	function zz() {
		# default to dev session
		if [ -z "$1" ]; then
			zellij a dev
		# otherwise create/attach to a named session
		else
			zellij -s "$1"
		fi
	}
fi

# bat
if command -v bat >/dev/null 2>&1; then
	alias cat=bat
fi

# starship
if command -v starship >/dev/null 2>&1; then
	eval "$(starship init zsh)"
fi

# neovim
if command -v nvim >/dev/null 2>&1; then
	function v() {
		if [[ "$PWD" == $CONFIG* ]]; then
			if command -v yadm >/dev/null 2>&1; then
				yadm enter nvim $@
			fi
		else
			nvim $@
		fi
	}
	export EDITOR=nvim
fi

# lazygit
if command -v lazygit >/dev/null 2>&1; then
	function gg() {
		if [[ "$PWD" == $CONFIG* ]]; then
			if command -v yadm >/dev/null 2>&1; then
				cd
				yadm enter lazygit
				cd -
			fi
		else
			lazygit
		fi
	}
fi

# ripgrep
if command -v rg >/dev/null 2>&1; then
	export RIPGREP_CONFIG_PATH="$CONFIG/.ripgreprc"
fi
