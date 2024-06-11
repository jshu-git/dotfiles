return {
	{
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
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text_pos = "right_align",
					delay = 10,
					ignore_whitespace = true,
				},
				current_line_blame_formatter = "<author> (<author_time:%R>): <summary>",
				diff_opts = {
					vertical = false,
					ignore_blank_lines = true,
				},
			})

			-- toggles
			vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git: Toggle Blame" })
			vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Git: Toggle Diff" })

			-- blame
			vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame" })

			-- hunks
			vim.keymap.set("n", "<leader>gs", gitsigns.preview_hunk, { desc = "Hover Hunk" })
			vim.keymap.set("n", "<leader>ga", gitsigns.stage_hunk, { desc = "Stage Hunk" })
			vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
			vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
			vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
			vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff" })

			-- visual
			vim.keymap.set("v", "<leader>gh", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage Hunk" })
			vim.keymap.set("v", "<leader>gH", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset Hunk" })

			-- text object
			vim.keymap.set({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>")

			-- navigate
			vim.keymap.set("n", "[h", function()
				gitsigns.nav_hunk("prev")
			end, { desc = "Previous Hunk" })
			vim.keymap.set("n", "]h", function()
				gitsigns.nav_hunk("next")
			end, { desc = "Next Hunk" })
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
				mappings = nil,
				callbacks = {
					["bitbucket.ngage.netapp.com"] = function(url_data)
						-- https://bitbucket.ngage.netapp.com/scm/op/api
						local url = require("gitlinker.hosts").get_base_https_url(url_data)

						-- https://bitbucket.ngage.netapp.com/projects/op/api
						url = url:gsub("/scm/", "/projects/")

						-- https://bitbucket.ngage.netapp.com/projects/op/repos/api
						local parts = vim.split(url, "/")
						table.insert(parts, #parts, "repos")
						url = table.concat(parts, "/")

						-- https://bitbucket.ngage.netapp.com/projects/repos/op/api/ .. /browse/ .. ontap/api/__init__.py
						url = url .. "/browse/" .. url_data.file

						-- line numbers
						if url_data.lstart then
							url = url .. "#" .. url_data.lstart
						end
						if url_data.lend then
							url = url .. "-" .. url_data.lend
						end
						return url
					end,
				},
			})
			-- copy url
			vim.keymap.set("n", "<leader>gy", function()
				gitlinker.get_buf_range_url("n", { action_callback = actions.copy_to_clipboard })
			end, { desc = "Copy Git URL" })
			vim.keymap.set("v", "<leader>gy", function()
				gitlinker.get_buf_range_url("v", { action_callback = actions.copy_to_clipboard })
			end, { desc = "Copy Git URL" })

			-- open in browser
			vim.keymap.set("n", "<leader>gx", function()
				gitlinker.get_buf_range_url("n", { action_callback = actions.open_in_browser })
			end, { desc = "Open Git URL", silent = true })
			vim.keymap.set("v", "<leader>gx", function()
				gitlinker.get_buf_range_url("v", { action_callback = actions.open_in_browser })
			end, { desc = "Open Git URL", silent = true })
		end,
	},

	-- {
	-- 	"echasnovski/mini.diff",
	-- 	config = function()
	-- 		local diff = require("mini.diff")
	-- 		diff.setup({
	-- 			view = {
	-- 				style = "sign",
	-- 				signs = { add = "+", change = "~", delete = "-" },
	-- 			},
	-- 			mappings = {
	-- 				apply = "<leader>gh",
	-- 				reset = "<leader>gH",
	-- 				textobject = "ih",
	-- 				goto_first = "[H",
	-- 				goto_prev = "[h",
	-- 				goto_next = "]h",
	-- 				goto_last = "]H",
	-- 			},
	-- 		})
	-- 		vim.keymap.set("n", "<leader>gt", diff.toggle_overlay, { desc = "Toggle Overlay" })
	-- 	end,
	-- },
}
