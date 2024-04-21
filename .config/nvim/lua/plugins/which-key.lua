return {
	"folke/which-key.nvim",
	event = "VimEnter",
	init = function()
		local wk = require("which-key")
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		wk.setup({
			plugins = {
				marks = false,
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					-- g = false,
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
			["<leader>t"] = { name = "Toggle…" },
			["<leader>m"] = { name = "Menu…" },
		})
	end,
}
