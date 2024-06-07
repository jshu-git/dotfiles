return {
	"MagicDuck/grug-far.nvim",
	config = function()
		local grug = require("grug-far")
		grug.setup({
			startInInsertMode = false,
			keymaps = {
				replace = { n = "<leader>rR" },
				qflist = { n = "<leader>rQ" },
				syncLocations = { n = "<leader>rS" },
				syncLine = { n = "<leader>rL" },
				close = { n = "<leader>x" },
				historyOpen = { n = "<leader>rH" },
				-- historyAdd = { n = "<localleader>a" },
				refresh = { n = "<leader>rF" },
			},
			headerMaxWidth = 0.5 * vim.o.columns,
			icons = {
				enabled = false,
			},
		})

		vim.keymap.set("n", "<leader>rr", grug.grug_far, { desc = "Find and Replace" })
		vim.keymap.set("n", "<leader>rw", function()
			grug.grug_far({
				prefills = {
					search = vim.fn.expand("<cword>"),
					flags = vim.fn.expand("%"),
				},
			})
		end, { desc = "Find and Replace (Word in File)" })
		vim.keymap.set("n", "<leader>rf", function()
			grug.grug_far({
				prefills = {
					flags = vim.fn.expand("%"),
				},
			})
		end, { desc = "Find and Replace (File)" })
		vim.keymap.set(
			"v",
			"<leader>rr",
			":<C-u>lua require('grug-far').with_visual_selection({ prefills = { flags = vim.fn.expand('%') } })<CR>",
			{ desc = "Find and Replace (Selection)" }
		)
	end,
}
