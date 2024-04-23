return {
	{
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
					"NvimTree",
					"TelescopePrompt",
				},
			},
			never = {
				cursorline = {
					"alpha",
				},
				cursorcolumn = {
					"alpha",
				},
			},
		},
	},
}
