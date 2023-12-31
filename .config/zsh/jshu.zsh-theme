local time="%*"
local user="%n"
local host="$(hostname -d)"

# underline dir
local underline='%F{none}%U'
local end_underline='%u%f'
local dir="$underline%F{40}%~%f$end_underline"

local prompt_symbol="%F{white}∫%f"

PROMPT="%F{8}[$time $user@$host]%f $dir $prompt_symbol "
