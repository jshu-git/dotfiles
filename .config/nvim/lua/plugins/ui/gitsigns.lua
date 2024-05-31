return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "-" },
				-- changedelete = { text = "~" },
				-- untracked = { text = "┆" },
			},
			current_line_blame_opts = {
				virt_text_pos = "right_align",
				delay = 50,
				ignore_whitespace = true,
			},
			current_line_blame = true,
			current_line_blame_formatter = "<author> (<author_time:%R>) - <summary>",
		})

		-- toggle blame
		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame" })

		-- navigate hunks
		vim.keymap.set("n", "[H", function()
			gitsigns.nav_hunk("first")
		end, { desc = "First Hunk" })
		vim.keymap.set("n", "]H", function()
			gitsigns.nav_hunk("last")
		end, { desc = "Last Hunk" })
		vim.keymap.set("n", "[h", function()
			gitsigns.nav_hunk("prev")
		end, { desc = "Previous Hunk" })
		vim.keymap.set("n", "]h", function()
			gitsigns.nav_hunk("next")
		end, { desc = "Next Hunk" })
	end,
}
