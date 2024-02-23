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

setopt globdots

# completions
autoload -Uz compinit
compinit

# macos arrow keys https://linux.die.net/man/1/zshzle
bindkey "^[[1;3C" forward-word          # A-right
bindkey "^[[1;3D" backward-word         # A-left
bindkey "^[[1;9D" beginning-of-line     # Cmd-left
bindkey "^[[1;9C" end-of-line           # Cmd-right
bindkey "^[[Z"    reverse-menu-complete # S-Tab
bindkey "^Z"      undo
bindkey "^Y"      redo

# brew
export PATH=/opt/homebrew/bin:$PATH

CONFIG="$HOME/.config"
# zoxide replaces cd
if command -v zoxide > /dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"
fi
# eza replaces ls https://gist.github.com/eggbean/74db77c4f6404dd1f975bd6f048b86f8#file-eza-wrapper-sh
if command -v eza > /dev/null 2>&1; then
    [ -f $CONFIG/eza/eza-wrapper.sh ] && alias ls="$CONFIG/eza/eza-wrapper.sh"
fi

# fzf
if command -v fzf >/dev/null 2>&1; then
    FZF=$CONFIG/fzf
    [ -f $FZF/.fzf.zsh ] && source "$FZF/.fzf.zsh"
    [ -f $FZF/fzf-tab/fzf-tab.plugin.zsh ] && source $FZF/fzf-tab/fzf-tab.plugin.zsh
    # https://github.com/Aloxaf/fzf-tab/issues/362
    zstyle ':fzf-tab:*' fzf-flags --height 10%
fi

# zsh
ZSH="$CONFIG/zsh"
if [ -d $ZSH/plugins/fast-syntax-highlighting ]; then
    source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi
if [ -d $ZSH/plugins/zsh-autosuggestions ]; then
    source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
[ -f $ZSH/aliases.zsh ] && source $ZSH/aliases.zsh

# yadm
if command -v yadm >/dev/null 2>&1; then
    alias y='yadm'
    alias ys='y status'
    alias yd='y diff'
    alias yp='y pull'
    alias yl='y enter lazygit'
fi

# zellij
if command -v zellij >/dev/null 2>&1; then
    # use source
    # alias zellij=$HOME/.cargo/bin/zellij
    function zz() {
        # default to 'dev' session
        if [ -z "$1" ]; then
            zellij a dev
        else
            zellij -s "$1"
        fi
    }
fi

# ripgrep
if command -v ripgrep >/dev/null 2>&1; then
    [ -f $CONFIG/.ripgreprc ] && export RIPGREP_CONFIG_PATH="$CONFIG/.ripgreprc"
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

# helix
if command -v hx >/dev/null 2>&1; then
    # use source
    alias hx=$HOME/.cargo/bin/hx
    alias hxc="
    hx $HOME/README.md $HOME/.zshrc $CONFIG/starship.toml $CONFIG/alacritty/alacritty.toml $CONFIG/zellij/config.kdl $CONFIG/helix/config.toml
    "
    export VISUAL=hx
    export EDITOR="$VISUAL"
    alias xx=hx
fi
