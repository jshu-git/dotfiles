hyper = {"ctrl", "cmd", "alt", "shift"}

-- application switcher
apps = {
    {"V", "Visual Studio Code"},
    {"A", "Arc"},
    {"F", "Finder"},
}
for i, app in ipairs(apps) do
    hs.hotkey.bind(hyper, app[1], function()
        hs.application.launchOrFocus(app[2])
    end)
end

-- show desktop
hs.hotkey.bind(hyper, "D", function()
    hs.spaces.toggleShowDesktop()
end)
