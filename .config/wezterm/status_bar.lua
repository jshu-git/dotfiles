local wezterm = require 'wezterm'
local module  = {}

function module.apply_to_config(config)

  wezterm.on('update-right-status', function(window, pane)
    local cwd       = pane:get_current_working_dir().file_path
    local workspace = window:active_workspace()

    local elements = {
      { Text = ' ' .. cwd },
      { Text = ' [' .. workspace .. ']' },
    }
    window:set_right_status(wezterm.format(elements))
  end)
end

return module
