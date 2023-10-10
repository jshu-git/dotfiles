hyper = {'ctrl', 'cmd', 'alt', 'shift'}

-- application switcher
apps = {
    {'A', 'company.thebrowser.Browser'}, -- for some reason, only arc doesn't allow for hiding
    {'V', 'com.microsoft.VSCode'},
    {'F', 'com.apple.finder'},

    {'1', 'company.thebrowser.Browser'},
    {'2', 'com.microsoft.VSCode'},
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

-- hide all
hs.hotkey.bind(hyper, 'H', function()
    hs.fnutils.each(hs.application.runningApplications(), function(app)
        app:hide()
    end)

    -- send the 'command + option + h' keystroke to the system
    -- hs.eventtap.keyStroke({'cmd', 'option'}, 'h')
end)
