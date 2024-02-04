local wezterm = require 'wezterm'
local module  = {}

function module.apply_to_config(config)
  config.window_padding            = { left = 0, right = 0, top = 0, bottom = 0 }
  config.window_background_opacity = 0.85
  config.window_decorations        = 'RESIZE'
end

return module
