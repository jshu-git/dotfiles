-- https://wezfurlong.org/wezterm/config/lua/config/index.html
local wezterm = require 'wezterm'
local act     = wezterm.action
local mux     = wezterm.mux
local config  = wezterm.config_builder()

wezterm.on('gui-startup', function(cmd)
  -- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
  local main_tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()

  -- configs
  -- main_tab:set_title 'configs'
  -- pane:send_text 'cd .config && vim ~/README.md ~/.zshrc'

  -- shokz
  -- local tab, pane, window = window:spawn_tab {}
  -- tab:set_title 'shokz'
  -- pane:send_text 'cd ~/git/shokz_downloader && vim .'

  -- main_tab:activate()
end)

-- cursor
config.hide_mouse_cursor_when_typing = false

-- font
config.font        = wezterm.font 'FiraCode Nerd Font'
config.font_size   = 16.0
config.line_height = 0.9

-- keys
require('keys/custom').apply_to_config(config)

-- pane
config.inactive_pane_hsb = {
  saturation = 1,
  brightness = 1,
}

-- status bar
wezterm.on('update-right-status', function(window, pane)
  local cwd       = pane:get_current_working_dir().file_path
  local workspace = window:active_workspace()

  local elements = {
    { Text = ' ' .. cwd },
    { Text = ' [' .. workspace .. ']' },
  }
  window:set_right_status(wezterm.format(elements))
end)

-- tab bar
config.enable_tab_bar            = false
-- config.use_fancy_tab_bar         = false
-- config.tab_bar_at_bottom         = true
-- config.show_tab_index_in_tab_bar = false

-- theme
config.color_scheme = 'nightfox'

-- window
config.window_padding            = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_background_opacity = 0.85
config.window_decorations        = 'RESIZE'

-- misc
config.adjust_window_size_when_changing_font_size = false
config.audible_bell                               = 'Disabled'
config.mouse_wheel_scrolls_tabs                   = false
-- config.pane_focus_follows_mouse = true
-- config.prefer_to_spawn_tabs = true
config.scrollback_lines                            = 10000
config.skip_close_confirmation_for_processes_named = {}
config.show_new_tab_button_in_tab_bar              = false

return config
