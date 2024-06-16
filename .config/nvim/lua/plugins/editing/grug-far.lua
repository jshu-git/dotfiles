return {
	"MagicDuck/grug-far.nvim",
	config = function()
		local grug = require("grug-far")
		grug.setup({
			startInInsertMode = false,
			keymaps = {
				replace = { n = "<localleader>rr" },
				qflist = { n = "<C-q>" },
				syncLocations = { n = "<localleader>rS" },
				syncLine = { n = "<localleader>rl" },
				close = { n = "<localleader>q" },
				historyOpen = { n = "<localleader>rh" },
				historyAdd = { n = "<localleader>rH" },
				refresh = { n = "<localleader>rR" },
				abort = { n = "<C-c>" },
			},
			headerMaxWidth = math.floor(0.4 * vim.o.columns),
			icons = {
				enabled = false,
			},
			placeholders = {
				flags = "--ignore-case(-i) --fixed-strings(-F) --multiline(-U)",
			},
		})

		vim.keymap.set("n", "<leader>rr", grug.grug_far, { desc = "Replace (Global)" })
		-- vim.keymap.set("n", "<leader>r*", function()
		-- 	grug.grug_far({
		-- 		prefills = {
		-- 			search = vim.fn.expand("<cword>"),
		-- 			filesFilter = vim.fn.expand("%"),
		-- 		},
		-- 	})
		-- end, { desc = "Find and Replace (cword)" })
		vim.keymap.set("n", "<leader>rf", function()
			grug.grug_far({
				prefills = {
					filesFilter = vim.fn.expand("%"),
				},
			})
		end, { desc = "Replace (File)" })
	end,
}
