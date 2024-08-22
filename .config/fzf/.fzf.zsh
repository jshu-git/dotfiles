# https://github.com/junegunn/fzf?tab=readme-ov-file
source <(fzf --zsh)

# https://www.mankier.com/1/fzf#Options-Interface
export FZF_DEFAULT_OPTS="
--color=light
--no-multi
--pointer ▶
--border=sharp
--bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'
"

# fd https://github.com/sharkdp/fd?tab=readme-ov-file#using-fd-with-fzf
for i in .git .cache .vscode .cargo .rustup .npm; do
	FD_EXCLUDE="$FD_EXCLUDE --exclude $i"
done
export FZF_DEFAULT_COMMAND="fd --type f --type l --follow --hidden $FD_EXCLUDE"

# history
export FZF_CTRL_R_OPTS="--info=hidden"
bindkey "^[[A" fzf-history-widget

# cd widget
# bindkey '^[[Z' fzf-cd-widget

# fzf-tab-completion
if [ -d $CONFIG/fzf/plugins/fzf-tab-completion ]; then
	source $CONFIG/fzf/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
fi
