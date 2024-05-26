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
				enabled = true,
				-- jump_labels = true,
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
			"gw",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"gW",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash (Treesitter)",
		},
	},
}
