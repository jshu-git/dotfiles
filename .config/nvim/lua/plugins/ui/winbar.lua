return {
	{
		"ramilito/winbar.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("winbar").setup({
				icons = true,
				diagnostics = false,
				buf_modified = true,
				buf_modified_symbol = "●",
				dim_inactive = {
					enabled = true,
					highlight = "NonText",
					icons = true,
					name = true,
				},
			})
		end,
	},

	{
		"nvim-zh/colorful-winsep.nvim",
		event = "WinNew",
		config = function()
			require("colorful-winsep").setup({
				symbols = { "─", "│", "┌", "┐", "└", "┘" },
				hi = { link = "DiagnosticWarn" },
				smooth = false,
				exponential_smoothing = false,
			})
		end,
	},
}
