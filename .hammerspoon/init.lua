hyper = {'ctrl', 'cmd', 'alt'}

-- application switcher
apps = {
    {'1', 'company.thebrowser.Browser'}, -- for some reason, only arc doesn't allow for hiding
    {'2', 'com.microsoft.VSCode'},
    {'F', 'com.apple.finder'},
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

-- show desktop
hs.hotkey.bind(hyper, 'D', function()
    hs.spaces.toggleShowDesktop()
end)

-- minimize all except current focused window
hs.hotkey.bind(hyper, 'H', function()
    local windows = hs.window.visibleWindows()
    local focusedWindow = hs.window.focusedWindow()
    for i, window in ipairs(windows) do
        if window ~= focusedWindow then
            window:minimize()
        end
    end
end)

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