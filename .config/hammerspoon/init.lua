-- https://github.com/Hammerspoon/hammerspoon/pull/582
-- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

-- local geometry = require("hs.geometry")
-- local hyper = { "ctrl", "cmd", "alt" }
hs.loadSpoon("EmmyLua")

-- reload
hs.hotkey.bind("alt", "r", hs.reload)

-- show desktop
-- hs.hotkey.bind("alt", "d", hs.spaces.toggleShowDesktop)

-- application switcher
for key, name in pairs({
	-- https://github.com/Hammerspoon/hammerspoon/issues/2256
	-- ["1"] = "Firefox",

	["1"] = "Google Chrome",
	-- ["1"] = "Zen Browser",
	["2"] = "Alacritty",
	["3"] = "Messages",
	["b"] = "BambuStudio",
}) do
	hs.hotkey.bind("alt", key, function()
		-- hs.application.launchOrFocusByBundleID(name)
		hs.application.launchOrFocus(name)
	end)
end

-- old application switcher
-- local apps = {
-- 	-- {'1', 'company.thebrowser.Browser'}, -- for some reason, only arc doesn't allow for hiding
-- 	-- {'2', 'com.microsoft.VSCode'},
-- 	{ "A", "org.alacritty" },
-- 	-- {'F', 'com.apple.finder'},
-- }
-- for i, app in ipairs(apps) do
-- 	hs.hotkey.bind(hyper, app[1], function()
-- 		local appObj = hs.application.get(app[2])
--
-- 		if not appObj then
-- 			-- The app is not running, so launch it
-- 			hs.application.launchOrFocusByBundleID(app[2])
-- 		elseif appObj:isFrontmost() then
-- 			-- The app is running and in focus, so send it to the back
-- 			appObj:hide()
-- 		else
-- 			-- The app is running but not in focus, so focus it
-- 			hs.application.launchOrFocusByBundleID(app[2])
-- 		end
-- 	end)
-- end
