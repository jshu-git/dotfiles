return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		labels = "12345abcdefghijklmnopqrstuvwxyz",
		jump = {
			autojump = true,
		},
		label = {
			rainbow = { enabled = true },
		},
		modes = {
			search = {
				enabled = false,
			},
			char = {
				enabled = false,
				jump_labels = true,
			},
			treesitter = {
				labels = "12345abcdefghijklmnopqrstuvwxyz",
			},
		},
		prompt = {
			prefix = { { "⚡Flash ⚡", "FlashPromptIcon" } },
		},
	},
	keys = {
		{
			"f",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"F",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash (Treesitter)",
		},
	},
}
