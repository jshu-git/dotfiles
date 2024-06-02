return {
	{
		"echasnovski/mini.jump",
		config = function()
			require("mini.jump").setup({
				mappings = {
					repeat_jump = "",
				},
			})
		end,
	},

	{
		"echasnovski/mini.jump2d",
		config = function()
			local jump2d = require("mini.jump2d")
			jump2d.setup({
				labels = "asdfgqwertzxcvhjklyuiopbnm",
				mappings = {
					start_jumping = "",
				},
			})

			-- jump to any word
			vim.keymap.set("n", "gw", function()
				local opts = vim.tbl_deep_extend("force", jump2d.builtin_opts.word_start, {
					view = { n_steps_ahead = 1 },
					allowed_windows = { not_current = false },
					hl_group = "Search",
					hl_group_ahead = "Search",
				})
				jump2d.start(opts)
			end)
		end,
	},

	-- event = "VeryLazy",
	-- "folke/flash.nvim",
	-- opts = {
	-- 	labels = "abcdefgqwertzxcvhijklyuiopbnm",
	-- 	jump = {
	-- 		autojump = true,
	-- 	},
	-- 	label = {
	-- 		rainbow = { enabled = true },
	-- 	modes = {
	-- 	},
	-- 		search = {
	-- 			enabled = false,
	-- 		},
	-- 		char = {
	-- 			enabled = false,
	-- 			jump_labels = true,
	-- 		},
	-- 		treesitter = {
	-- 			labels = "abcdefgqwertzxcvhijklyuiopbnm",
	-- 		},
	-- 	},
	-- 	prompt = {
	-- 		prefix = { { "⚡Flash ⚡", "FlashPromptIcon" } },
	-- 	},
	-- },
	-- keys = {
	-- 	{
	-- 		"f",
	-- 		mode = { "n", "x", "o" },
	-- 		function()
	-- 			require("flash").jump()
	-- 		end,
	-- 		desc = "Flash",
	-- 	},
	-- 	{
	-- 		"F",
	-- 		mode = { "n", "x", "o" },
	-- 		function()
	-- 			require("flash").treesitter()
	-- 		end,
	-- 		desc = "Flash (Treesitter)",
	-- 	},
	-- },
}
