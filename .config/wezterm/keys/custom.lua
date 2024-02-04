local wezterm = require 'wezterm'
local module  = {}
local act     = wezterm.action

function module.apply_to_config(config)
  config.disable_default_key_bindings = true
  config.leader                       = { key = 'a', mods = 'CTRL' }

  config.keys = {
    -- defaults https://wezfurlong.org/wezterm/config/default-keys.html?h=disable_default_key_bindings
    -- see wezterm/keys/default.lua
    { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
    { key = '0', mods = 'SUPER', action = act.ResetFontSize },
    { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
    { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
    { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'q', mods = 'SUPER', action = act.QuitApplication },
    { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
    { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },

    -- menus
    { key = 'P', mods = 'SUPER', action = act.ActivateCommandPalette },
    { key = 'X', mods = 'SUPER', action = act.ActivateCopyMode },
    { key = 'D', mods = 'SUPER', action = act.ShowDebugOverlay },
    { key = 'L', mods = 'SUPER', action = act.ShowLauncher },
    { key = 'R', mods = 'SUPER', action = act.ReloadConfiguration },

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
    -- https://wezfurlong.org/wezterm/cli/cli/set-tab-title.html
    { key = 'r',          mods = 'LEADER',
      action = act.PromptInputLine {
        description = 'enter new name for tab',
        action      = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end)
      }
    },
    { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
    { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
    { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
    { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
    { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
  }
end

return module
