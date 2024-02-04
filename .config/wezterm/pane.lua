local wezterm = require 'wezterm'
local module  = {}

function module.apply_to_config(config)
  config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 1,
  }
end

return module
