return {
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				view = {
					style = "sign",
					signs = { add = "+", change = "~", delete = "-" },
				},
				mappings = {
					apply = "<leader>gh",
					reset = "<leader>gH",
					textobject = "ih",
					goto_first = "[H",
					goto_prev = "[h",
					goto_next = "]h",
					goto_last = "]H",
				},
			})
			vim.keymap.set("n", "<leader>gt", diff.toggle_overlay, { desc = "Toggle Overlay" })
		end,
	},

	{
		"ruifm/gitlinker.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local gitlinker = require("gitlinker")
			local actions = require("gitlinker.actions")

			require("gitlinker").setup({
				-- remote = nil,
				mappings = nil,
			})

			-- copy url
			vim.keymap.set("n", "<leader>gy", function()
				gitlinker.get_buf_range_url("n", { action_callback = actions.copy_to_clipboard })
			end, { desc = "Copy Git URL" })
			vim.keymap.set("v", "<leader>gy", function()
				gitlinker.get_buf_range_url("v", { action_callback = actions.copy_to_clipboard })
			end, { desc = "Copy Git URL" })
			-- copy homepage
			vim.keymap.set("n", "<leader>gY", gitlinker.get_repo_url, { desc = "Copy Git URL (Homepage)" })

			-- open in browser
			vim.keymap.set("n", "<leader>gx", function()
				gitlinker.get_buf_range_url("n", { action_callback = actions.open_in_browser })
			end, { desc = "Open Git URL", silent = true })
			vim.keymap.set("v", "<leader>gx", function()
				gitlinker.get_buf_range_url("v", { action_callback = actions.open_in_browser })
			end, { desc = "Open Git URL", silent = true })
			-- open homepage
			vim.keymap.set("n", "<leader>gX", function()
				gitlinker.get_repo_url({ action_callback = actions.open_in_browser })
			end, { desc = "Open Git URL (Homepage)", silent = true })
		end,
	},

	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		local gitsigns = require("gitsigns")
	-- 		gitsigns.setup({copy_to_clipboard
	-- 			signs = {
	-- 				add = { text = "+" },
	-- 				change = { text = "~" },
	-- 				delete = { text = "-" },
	-- 				topdelete = { text = "-" },
	-- 				-- changedelete = { text = "~" },
	-- 				-- untracked = { text = "┆" },
	-- 			},
	-- 			current_line_blame_opts = {
	-- 				virt_text_pos = "right_align",
	-- 				delay = 50,
	-- 				ignore_whitespace = true,
	-- 			},
	-- 			current_line_blame = true,
	-- 			current_line_blame_formatter = "<author> (<author_time:%R>) - <summary>",
	-- 		})
	--
	-- 		-- toggle blame
	-- 		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame" })
	-- 		vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted)
	--
	-- 		-- hunks
	-- 		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
	-- 		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
	-- 		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
	-- 		vim.keymap.set("n", "<leader>hS", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
	--
	-- 		-- visual
	-- 		vim.keymap.set("v", "<leader>hs", function()
	-- 			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	-- 		end, { desc = "Stage Hunk" })
	-- 		vim.keymap.set("v", "<leader>hr", function()
	-- 			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	-- 		end, { desc = "Reset Hunk" })
	-- 		-- vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer)
	-- 		-- vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer)
	-- 		-- vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
	-- 		-- vim.keymap.set("n", "<leader>hD", function()
	-- 		-- 	gitsigns.diffthis("~")
	-- 		-- end)
	--
	-- 		-- text object
	-- 		vim.keymap.set({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>")
	--
	-- 		-- navigate
	-- 		vim.keymap.set("n", "[H", function()
	-- 			gitsigns.nav_hunk("first")
	-- 		end, { desc = "First Hunk" })
	-- 		vim.keymap.set("n", "]H", function()
	-- 			gitsigns.nav_hunk("last")
	-- 		end, { desc = "Last Hunk" })
	-- 		vim.keymap.set("n", "[h", function()
	-- 			gitsigns.nav_hunk("prev")
	-- 		end, { desc = "Previous Hunk" })
	-- 		vim.keymap.set("n", "]h", function()
	-- 			gitsigns.nav_hunk("next")
	-- 		end, { desc = "Next Hunk" })
	-- 	end,
	-- },
}
