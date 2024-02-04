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
  main_tab:set_title 'configs'
  pane:send_text 'cd .config && hx ~/README.md ~/.zshrc\n'

  -- shokz
  local tab, pane, window = window:spawn_tab {}
  tab:set_title 'shokz'
  pane:send_text 'cd ~/git/shokz_downloader && hx .\n'

  main_tab:activate()
end)

-- apply modules
require('cursor').apply_to_config(config)
require('font').apply_to_config(config)
require('keys/custom').apply_to_config(config)
require('pane').apply_to_config(config)
require('status_bar').apply_to_config(config)
require('tab_bar').apply_to_config(config)
require('theme').apply_to_config(config)
require('window').apply_to_config(config)

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
