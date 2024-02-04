local wezterm = require 'wezterm'
local module  = {}

function module.apply_to_config(config)
  config.cursor_blink_ease_in          = 'Constant'
  config.cursor_blink_ease_out         = 'Constant'
  config.cursor_blink_rate             = 400
  config.default_cursor_style          = 'BlinkingBar'
  config.hide_mouse_cursor_when_typing = false
end

return module
