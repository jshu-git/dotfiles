return {
	{
		"echasnovski/mini.basics",
		config = function()
			require("mini.basics").setup({
				options = {
					win_borders = "single",
				},
				mappings = {
					basic = false,
					windows = true,
					move_with_alt = true,
				},
				autocommands = {
					basic = false,
				},
			})
		end,
	},

	{
		"echasnovski/mini.misc",
		config = function()
			local misc = require("mini.misc")
			misc.setup_restore_cursor()
		end,
	},
}
