hyper = {'ctrl', 'cmd', 'alt'}

-- hyper application switcher
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

-- hide all except current focused window (cmd + alt + h)
hs.hotkey.bind(hyper, 'H', function()
    hs.timer.doAfter(0.1, function()
        hs.eventtap.keyStroke({'cmd', 'alt'}, 'H')
    end)
end)
