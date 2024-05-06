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
		highlight = {
			backdrop = false,
		},
		modes = {
			search = {
				enabled = false,
			},
			char = {
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
			"<leader>j",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter({
					label = {
						-- before = true,
						-- after = false,
						rainbow = { enabled = true },
					},
				})
			end,
			desc = "Flash (Treesitter)",
		},
	},
}
