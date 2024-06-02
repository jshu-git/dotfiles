return {
	"echasnovski/mini.basics",
	version = "*",
	config = function()
		require("mini.basics").setup({
			options = {
				extra_ui = true,
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
}
