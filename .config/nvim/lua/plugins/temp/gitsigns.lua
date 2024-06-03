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
		vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted)

		-- hunks
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
		vim.keymap.set("n", "<leader>hS", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })

		-- visual
		vim.keymap.set("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage Hunk" })
		vim.keymap.set("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset Hunk" })
		-- vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer)
		-- vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer)
		-- vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
		-- vim.keymap.set("n", "<leader>hD", function()
		-- 	gitsigns.diffthis("~")
		-- end)

		-- text object
		vim.keymap.set({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>")

		-- navigate
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
