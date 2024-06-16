return {
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
}
