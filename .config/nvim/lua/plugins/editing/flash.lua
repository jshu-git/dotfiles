return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = function()
			local flash = require("flash")
			flash.setup({
				label = {
					rainbow = { enabled = true },
				},
				highlight = {
					groups = {
						backdrop = "NonText",
					},
				},
				modes = {
					char = { enabled = false },
				},
				prompt = {
					prefix = { { " Flash : ", "FlashPromptIcon" } },
					win_config = { row = -3 },
				},
			})

			-- jump to any word
			vim.keymap.set("n", "gw", function()
				flash.jump({
					search = {
						mode = function(str)
							return "\\<" .. str
						end,
					},
				})
			end, { desc = "Flash (Word)" })
		end,
	},

	{
		"echasnovski/mini.jump",
		config = function()
			require("mini.jump").setup({
				mappings = {
					repeat_jump = "", -- defaults to ;
				},
			})
		end,
	},

	-- {
	-- 	"echasnovski/mini.jump2d",
	-- 	config = function()
	-- 		local jump2d = require("mini.jump2d")
	-- 		jump2d.setup({
	-- 			labels = "asdfghjklqwertyuiopzxcvbnm",
	-- 			mappings = {
	-- 				start_jumping = "",
	-- 			},
	-- 		})
	--
	-- 		-- jump to any word
	-- 		vim.keymap.set("n", "gw", function()
	-- 			local opts = vim.tbl_deep_extend("force", jump2d.builtin_opts.word_start, {
	-- 				view = {
	-- 					n_steps_ahead = 1,
	-- 				},
	-- 				allowed_lines = {
	-- 					blank = false,
	-- 				},
	-- 				allowed_windows = { not_current = false },
	-- 				-- hl_group = "CurSearch",
	-- 				-- hl_group_ahead = "CurSearch",
	-- 				-- hl_group_unique = "CurSearch",
	-- 			})
	-- 			jump2d.start(opts)
	-- 		end, { desc = "Jump (Word)" })
	-- 	end,
	-- },
}
