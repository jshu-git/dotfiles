-- https://github.com/Hammerspoon/hammerspoon/pull/582
-- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

local geometry = require("hs.geometry")
local hyper    = { "ctrl", "cmd", "alt" }

-- window positions
hs.window.animationDuration = 0
local windowPositions = {
    hs.layout.maximized,
    -- centered
    geometry.rect(0.2, 0.1, 0.6, 0.8),
    -- hs.layout.left50,
    -- hs.layout.right50,
}

-- cycle through window positions
local counter = 1
hs.hotkey.bind(hyper, "return", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(windowPositions[counter])

    if counter == #windowPositions then
        counter = 1
    else
        counter = counter + 1
    end
end)

-- decrease window size
hs.hotkey.bind(hyper, "-", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = win:screen():frame()

    f.x = f.x + (max.w / 30)
    f.y = f.y + (max.h / 30)
    f.w = f.w - (max.w / 15)
    f.h = f.h - (max.h / 15)
    win:setFrame(f)
end)

-- increase window size
hs.hotkey.bind(hyper, "=", function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = win:screen():frame()

    f.x = f.x - (max.w / 30)
    f.y = f.y - (max.h / 30)
    f.w = f.w + (max.w / 15)
    f.h = f.h + (max.h / 15)
    win:setFrame(f)
end)


-- show desktop
hs.hotkey.bind(hyper, "D", function()
    hs.spaces.toggleShowDesktop()
end)

-- open Finder (Desktop folder)
hs.hotkey.bind(hyper, "F", function()
    local command = [[ open $HOME/Desktop ]]
    hs.execute(command)
end)

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
    {'A', 'org.alacritty'},
    {'C', 'com.microsoft.VSCode'},
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
