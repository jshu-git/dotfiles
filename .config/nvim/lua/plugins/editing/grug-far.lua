return {
	"MagicDuck/grug-far.nvim",
	config = function()
		local grug = require("grug-far")
		grug.setup({
			startInInsertMode = false,
			keymaps = {
				replace = { n = "<localleader>rgr" },
				qflist = { n = "<C-q>" },
				syncLocations = { n = "<localleader>rgs" },
				syncLine = { n = "<localleader>rgl" },
				close = { n = "<localleader>x" },
				historyOpen = { n = "<localleader>rgh" },
				historyAdd = { n = "<localleader>rgH" },
				refresh = { n = "<localleader>rgf" },
			},
			headerMaxWidth = 0.5 * vim.o.columns,
			icons = {
				enabled = false,
			},
		})

		vim.keymap.set("n", "<leader>rr", grug.grug_far, { desc = "Find and Replace" })
		vim.keymap.set("n", "<leader>r*", function()
			grug.grug_far({
				prefills = {
					search = vim.fn.expand("<cword>"),
					filesFilter = vim.fn.expand("%"),
				},
			})
		end, { desc = "Find and Replace (cword)" })
		vim.keymap.set("n", "<leader>rf", function()
			grug.grug_far({
				prefills = {
					filesFilter = vim.fn.expand("%"),
				},
			})
		end, { desc = "Find and Replace (File)" })

		vim.keymap.set(
			"v",
			"<leader>rr",
			":<C-u>lua require('grug-far').with_visual_selection({ prefills = { filesFilter = vim.fn.expand('%') } })<CR>",
			{ desc = "Find and Replace (Selection)" }
		)
		-- vim.keymap.set(
		-- 	"v",
		-- 	"<leader>rr",
		-- 	":<C-u>lua require('grug-far').with_visual_selection({ prefills = { flags = vim.fn.expand('%') } })<CR>",
		-- 	{ desc = "Find and Replace (Selection)" }
		-- )
	end,
}
