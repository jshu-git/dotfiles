-- https://github.com/Hammerspoon/hammerspoon/pull/582
-- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

hs.loadSpoon("EmmyLua")

-- reload
hs.hotkey.bind("alt", "r", hs.reload)

-- show desktop
hs.hotkey.bind("alt", "d", hs.spaces.toggleShowDesktop)

-- application switcher
for key, name in pairs({
	["1"] = "Zen Browser",
	["2"] = "Alacritty",
}) do
	hs.hotkey.bind("alt", key, function()
		-- hs.application.launchOrFocusByBundleID(name)
		hs.application.launchOrFocus(name)
	end)
end
