-- https://wezfurlong.org/wezterm/config/lua/config/index.html
local wezterm = require 'wezterm'
local act     = wezterm.action
local mux     = wezterm.mux
local config  = wezterm.config_builder()

-- start maximized
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- theme
config.color_scheme = 'nightfox'

-- tab bar
config.use_fancy_tab_bar         = false
config.tab_bar_at_bottom         = true
config.show_tab_index_in_tab_bar = false

-- status bar
wezterm.on('update-right-status', function(window, pane)
  local elements = {
    -- active workspace
    -- { Text = window:active_workspace() },
    -- cwd
    { Text = pane:get_current_working_dir().file_path }
  }
  window:set_right_status(wezterm.format(elements))
end)

-- window
config.window_padding            = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_background_opacity = 0.90
config.window_decorations        = 'RESIZE'
config.text_background_opacity   = 0.3

-- pane
config.inactive_pane_hsb = {
  saturation = 1,
  brightness = 1,
}

-- font
config.font        = wezterm.font 'FiraCode Nerd Font'
config.font_size   = 14.0
config.line_height = 0.9
-- config.cell_width = 0.9

-- bindings
config.disable_default_key_bindings = true
config.leader = {
  key  = 'a',
  mods = 'CTRL'
}
config.keys = {
  -- defaults https://wezfurlong.org/wezterm/config/default-keys.html?h=disable_default_key_bindings
  { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
  { key = '0', mods = 'SUPER', action = act.ResetFontSize },
  { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
  { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
  { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'q', mods = 'SUPER', action = act.QuitApplication },
  { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
  -- { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
  { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
  -- { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  -- { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
  -- { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

  -- menus
  { key = 'P',          mods = 'SUPER', action = act.ActivateCommandPalette },
  { key = 'X',          mods = 'SUPER', action = act.ActivateCopyMode },
  { key = 'D',          mods = 'SUPER', action = act.ShowDebugOverlay },
  { key = 'L',          mods = 'SUPER', action = act.ShowLauncher },

  -- panes
  { key = 'LeftArrow',  mods = 'SUPER',  action = act.AdjustPaneSize{ 'Left', 4 } },
  { key = 'RightArrow', mods = 'SUPER',  action = act.AdjustPaneSize{ 'Right', 4 } },
  { key = 'UpArrow',    mods = 'SUPER',  action = act.AdjustPaneSize{ 'Up', 4 } },
  { key = 'DownArrow',  mods = 'SUPER',  action = act.AdjustPaneSize{ 'Down', 4 } },
  { key = 'h',          mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l',          mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'k',          mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'j',          mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
  { key = 's',          mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'a',          mods = 'LEADER', action = act.SplitVertical   { domain = 'CurrentPaneDomain' } },

  -- tabs
  { key = 'Tab',        mods = 'CTRL',       action = act.ActivateTabRelative(1) },
  { key = 'Tab',        mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'LeftArrow',  mods = 'LEADER',     action = act.MoveTabRelative(-1) },
  { key = 'RightArrow', mods = 'LEADER',     action = act.MoveTabRelative(1) },
  { key = 'r',          mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action      = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)
    }
  },
}

-- cursor
config.cursor_blink_ease_in          = "Constant"
config.cursor_blink_ease_out         = "Constant"
config.cursor_blink_rate             = 400
config.default_cursor_style          = 'BlinkingBar'
config.hide_mouse_cursor_when_typing = false

-- misc
config.adjust_window_size_when_changing_font_size = false
config.audible_bell                               = "Disabled"
config.mouse_wheel_scrolls_tabs                   = false
-- config.pane_focus_follows_mouse = true
-- config.prefer_to_spawn_tabs = true
config.scrollback_lines                            = 10000
config.skip_close_confirmation_for_processes_named = {}
config.show_new_tab_button_in_tab_bar              = false
config.window_close_confirmation                   = 'AlwaysPrompt'

return config
