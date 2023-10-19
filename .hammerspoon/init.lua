hyper = {'ctrl', 'cmd', 'alt'}

-- window management
hs.window.animationDuration = 0
-- toggle maximize/center
hs.hotkey.bind(hyper, 'return', function()
    local win   = hs.window.focusedWindow()
    local frame = win:frame()
    local max   = win:screen():frame()
    if frame.x == max.x and
       frame.y == max.y and
       frame.w == max.w and
       frame.h == max.h then
        frame.w = max.w * 0.8
        frame.h = max.h * 0.8
        frame.x = (max.w - frame.w) / 2
        frame.y = (max.h - frame.h) / 2
        win:setFrame(frame)
    else
        win:maximize()
    end
end)
-- decrease window size
hs.hotkey.bind(hyper, '-', function()
    local win = hs.window.focusedWindow()
    local f   = win:frame()
    local max = screen:frame()

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
    local max = screen:frame()

    f.x = f.x - (max.w / 30)
    f.y = f.y - (max.h / 30)
    f.w = f.w + (max.w / 15)
    f.h = f.h + (max.h / 15)
    win:setFrame(f)
end)

-- application switcher
-- apps = {
    -- {'1', 'company.thebrowser.Browser'}, -- for some reason, only arc doesn't allow for hiding
    -- {'2', 'com.microsoft.VSCode'},
    -- {'3', 'org.alacritty'},
    -- {'F', 'com.apple.finder'},
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
hs.hotkey.bind(hyper, 'M', function()
    local visibleWindows = hs.window.visibleWindows()

    -- Finder is always visible
    if #visibleWindows == 1 then
        local minimizedWindows = hs.window.minimizedWindows()
        for i, window in ipairs(minimizedWindows) do
            window:unminimize()
        end
    else
        for i, window in ipairs(visibleWindows) do
            window:minimize()
        end
    end
end)

-- alfred universal action
hs.hotkey.bind(hyper, 'A', function()
    hs.timer.doAfter(0.2, function()
        hs.eventtap.keyStroke({'cmd'}, '/')
    end)
end)

-- open latest Desktop file
hs.hotkey.bind(hyper, 'O', function()
    local command = [[
    DOWNLOADS="$HOME/Desktop"
    if [ -n "$(ls $DOWNLOADS)" ]; then
        RECENT=$(mdls -name kMDItemFSName -name kMDItemDateAdded ~/Desktop/* | \
        awk 'NR%2{printf "%s ",$0;next;}1' | \
        sort -r | \
        awk -F\\\" '{print $2}' | \
        head -n1)
        open -R "$DOWNLOADS/$RECENT"
    else
        open "$DOWNLOADS"
    fi
    ]]
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

-- alacritty hotkey window
-- doubleTap = require('modifierDoubleTap')
-- doubleTap.modifier = 'alt'
-- doubleTap.action = function ()
--     -- hs.application.launchOrFocusByBundleID('org.alacritty')
--     hs.eventtap.keyStroke(hyper, '3')
-- end
