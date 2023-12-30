-- https://github.com/Hammerspoon/hammerspoon/pull/582
-- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

local geometry = require("hs.geometry")
hyper = { "ctrl", "cmd", "alt" }

---------------------------
---- window management ----
---------------------------
hs.window.animationDuration = 0
windowPositions = {
    hs.layout.maximized,
    -- centered
    geometry.rect(0.1, 0.1, 0.8, 0.8),
    hs.layout.left50,
    hs.layout.right50,
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
    local f = win:frame()
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
    local f = win:frame()
    local max = win:screen():frame()

    f.x = f.x - (max.w / 30)
    f.y = f.y - (max.h / 30)
    f.w = f.w + (max.w / 15)
    f.h = f.h + (max.h / 15)
    win:setFrame(f)
end)


----------------
---- others ----
----------------
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
