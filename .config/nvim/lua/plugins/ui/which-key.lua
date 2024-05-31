return {
	"folke/which-key.nvim",
	event = "VimEnter",
	init = function()
		local wk = require("which-key")
		wk.setup({
			plugins = {
				marks = false,
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
				},
			},
			icons = {
				separator = "",
				group = "",
			},
			window = {
				border = "single",
				margin = { 0, 0, 0, 0 },
				padding = { 0, 0, 0, 0 },
			},
			layout = {
				spacing = 1,
			},
		})
		wk.register({
			["<leader>f"] = { name = "Find…" },
			["<leader>l"] = { name = "LSP…" },
			["<leader>s"] = { name = "Session…" },
			["<leader>t"] = { name = "Toggle…" },
		})
	end,
}
