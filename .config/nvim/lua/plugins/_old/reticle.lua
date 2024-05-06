return {
	"tummetott/reticle.nvim",
	event = "VeryLazy",
	opts = {
		on_startup = {
			cursorcolumn = true,
		},
		disable_in_insert = false,
		disable_in_diff = false,
		ignore = {
			cursorcolumn = {
				"TelescopePrompt",
			},
		},
		never = {
			cursorline = {
				"alpha",
				"lazy",
				"mason",
			},
			cursorcolumn = {
				"alpha",
				"lazy",
				"mason",
			},
		},
	},
}
