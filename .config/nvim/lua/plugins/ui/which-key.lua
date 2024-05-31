return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
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
			triggers_blacklist = {
				z = { "H" },
			},
		})
		wk.register({
			["<leader>f"] = { name = "Find…" },
			["<leader>l"] = { name = "LSP…" },
			["<leader>s"] = { name = "Session…" },
			["<leader>t"] = { name = "Toggle…" },

			-- disable some z mappings
			["zC"] = "which_key_ignore",
			["zc"] = "which_key_ignore",
			["zR"] = "which_key_ignore",
			["zr"] = "which_key_ignore",
			["zM"] = "which_key_ignore",
			["zm"] = "which_key_ignore",
			["zO"] = "which_key_ignore",
			["zo"] = "which_key_ignore",
			["z<CR>"] = "which_key_ignore",
			["zH"] = "which_key_ignore",
			["zL"] = "which_key_ignore",
			["ze"] = "which_key_ignore",
			["zb"] = "which_key_ignore",
			["zs"] = "which_key_ignore",
			["zt"] = "which_key_ignore",
			["zv"] = "which_key_ignore",
			["zw"] = "which_key_ignore",
			["zg"] = "which_key_ignore",

			-- disable some g mappings
			["g%"] = "which_key_ignore",
			["gc"] = "which_key_ignore",
			["gn"] = "which_key_ignore",
			["gN"] = "which_key_ignore",
			["gt"] = "which_key_ignore",
			["gT"] = "which_key_ignore",
		})
	end,
}
