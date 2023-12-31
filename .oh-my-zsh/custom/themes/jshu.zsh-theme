local time="%*"
local user="%n"
# host
# local host="%M"
local host="$(hostname -d)"
# underline dir
local underline='%F{none}%U'
local end_underline='%u%f'
local dir="$underline%F{40}%~%f$end_underline"
local git='%F{yellow}$(git_prompt_info)%f'
local prompt_symbol="%F{white}∫%f"

PROMPT="%F{8}[$time $user@$host]%f $dir$git $prompt_symbol "
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
