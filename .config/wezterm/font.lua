local wezterm = require 'wezterm'
local module  = {}

function module.apply_to_config(config)
  config.font        = wezterm.font 'FiraCode Nerd Font'
  config.font_size   = 16.0
  config.line_height = 0.9
  -- config.cell_width = 0.9
end

return module
