-- https://github.com/Hammerspoon/hammerspoon/pull/582
-- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

local geometry = require("hs.geometry")
-- local hyper = { "ctrl", "cmd", "alt" }
local hyper = { "cmd", "alt" }

-- shift deletes
local shiftDelete = function()
  hs.eventtap.keyStroke({}, "forwarddelete", 20000)
end
local shiftCmdDelete = function()
  hs.eventtap.keyStroke({ "ctrl" }, "k", 20000)
end
hs.hotkey.bind({ "shift" }, "delete", shiftDelete, nil, shiftDelete)
hs.hotkey.bind({ "cmd", "shift" }, "delete", shiftCmdDelete, nil, shiftCmdDelete)

-- application switcher
local apps = {
  -- { "A", "org.alacritty" },
  -- {'C', 'com.microsoft.VSCode'},
}
for i, app in ipairs(apps) do
  hs.hotkey.bind(hyper, app[1], function()
    local appObj = hs.application.get(app[2])

    if not appObj then
      -- The app is not running, so launch it
      hs.application.launchOrFocusByBundleID(app[2])
    elseif appObj:isFrontmost() then
      -- The app is running and in focus, so send it to the back
      appObj:hide()
    else
      -- The app is running but not in focus, so focus it
      hs.application.launchOrFocusByBundleID(app[2])
    end
  end)
end
