local wezterm = require 'wezterm'
local module  = {}

function module.apply_to_config(config)
  config.use_fancy_tab_bar         = false
  config.tab_bar_at_bottom         = true
  config.show_tab_index_in_tab_bar = false
end

return module
