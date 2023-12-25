hyper = {'ctrl', 'cmd', 'alt'}

-- window management
hs.window.animationDuration = 0
leftPositions = {
    hs.layout.left30,
    hs.layout.left50,
    hs.layout.left70,
    hs.layout.maximized
}
rightPositions = {
    hs.layout.right30,
    hs.layout.right50,
    hs.layout.right70,
    hs.layout.maximized
}
-- toggle maximize/center/stage manager size
hs.hotkey.bind(hyper, 'return', function()
    local win    = hs.window.focusedWindow()
    local frame  = win:frame()
    local max    = win:screen():frame()
    local custom = {x = 47, y = max.y, w = max.w, h = max.h}

    if frame.x == max.x and frame.y == max.y and frame.w == max.w and frame.h == max.h then
        -- if the window is maximized, set to custom size
        frame.x = custom.x
        frame.y = custom.y
        frame.w = custom.w
        frame.h = custom.h
    elseif frame.x == custom.x and frame.w == custom.w and frame.h == custom.h then
        -- if the window is at custom size, set to centered size
        local ratio = 0.8
        frame.x = max.x + (max.w * (1 - ratio) / 2)
        frame.y = max.y + (max.h * (1 - ratio) / 2)
        frame.w = max.w * ratio
        frame.h = max.h * ratio
    else
        -- if the window is at centered size, maximize it
        frame = max
    end
    win:setFrame(frame)
end)
-- decrease window size
hs.hotkey.bind(hyper, '-', function()
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
hs.hotkey.bind(hyper, '=', function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = win:screen():frame()

    f.x = f.x - (max.w / 30)
    f.y = f.y - (max.h / 30)
    f.w = f.w + (max.w / 15)
    f.h = f.h + (max.h / 15)
    win:setFrame(f)
end)
-- cycle maximize left
local leftCounter = 1
hs.hotkey.bind(hyper, 'left', function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(leftPositions[leftCounter])

    if leftCounter == #leftPositions then
        leftCounter = 1
    else
        leftCounter = leftCounter + 1
    end
end)
-- cycle maximize right
local rightCounter = 1
hs.hotkey.bind(hyper, 'right', function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(rightPositions[rightCounter])

    if rightCounter == #rightPositions then
        rightCounter = 1
    else
        rightCounter = rightCounter + 1
    end
end)

-- application switcher
-- apps = {
--     -- {'1', 'company.thebrowser.Browser'}, -- for some reason, only arc doesn't allow for hiding
--     -- {'2', 'com.microsoft.VSCode'},
--     {'A', 'org.alacritty'},
--     -- {'F', 'com.apple.finder'},
-- }
-- for i, app in ipairs(apps) do
--     hs.hotkey.bind(hyper, app[1], function()
--         local appObj = hs.application.get(app[2])

--         if not appObj then
--             -- The app is not running, so launch it
--             hs.application.launchOrFocusByBundleID(app[2])
--         elseif appObj:isFrontmost() then
--             -- The app is running and in focus, so send it to the back
--             appObj:hide()
--         else
--             -- The app is running but not in focus, so focus it
--             hs.application.launchOrFocusByBundleID(app[2])
--         end
--     end)
-- end

-- show desktop
hs.hotkey.bind(hyper, 'D', function()
    hs.spaces.toggleShowDesktop()
end)

-- minimize all except current focused window
-- hs.hotkey.bind(hyper, 'H', function()
--     local windows = hs.window.visibleWindows()
--     local focusedWindow = hs.window.focusedWindow()

--     for i, window in ipairs(windows) do
--         if window ~= focusedWindow then
--             window:minimize()
--         end
--     end
-- end)
-- minimize/unminimize all windows
-- hs.hotkey.bind(hyper, 'M', function()
--     local visibleWindows = hs.window.visibleWindows()

--     -- Finder is always visible
--     if #visibleWindows == 1 then
--         local minimizedWindows = hs.window.minimizedWindows()
--         for i, window in ipairs(minimizedWindows) do
--             window:unminimize()
--         end
--     else
--         for i, window in ipairs(visibleWindows) do
--             window:minimize()
--         end
--     end
-- end)

-- alfred universal action
-- hs.hotkey.bind(hyper, 'A', function()
--     hs.timer.doAfter(0.2, function()
--         hs.eventtap.keyStroke({'cmd'}, '/')
--     end)
-- end)

-- open Finder (Desktop folder)
hs.hotkey.bind(hyper, 'F', function()
    local command = [[ open $HOME/Desktop ]]
    hs.execute(command)
end)

-- shift deletes
local shiftDelete = function()
    hs.eventtap.keyStroke({}, 'forwarddelete', 20000)
end
local shiftCmdDelete = function()
    hs.eventtap.keyStroke({'ctrl'}, 'k', 20000)
end
hs.hotkey.bind({'shift'}, 'delete', shiftDelete, nil, shiftDelete)
hs.hotkey.bind({'cmd', 'shift'}, 'delete', shiftCmdDelete, nil, shiftCmdDelete)

-- function systemKey(key)
--     hs.eventtap.event.newSystemKeyEvent(string.upper(key), true):post()
--     hs.eventtap.event.newSystemKeyEvent(string.upper(key), false):post()
-- end
-- hs.hotkey.bind({'cmd'}, "j", function()
--     systemKey("BRIGHTNESS_DOWN")
-- end, nil, function()
--     systemKey("BRIGHTNESS_DOWN")
-- end)
