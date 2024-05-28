return {
	{
		"stevearc/oil.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local oil = require("oil")

			oil.setup({
				delete_to_trash = true,
				columns = {
					{
						"icon",
						add_padding = false,
					},
				},
				win_options = {
					number = false,
				},
				keymaps = {
					["?"] = "actions.show_help",
					["<leader>e"] = "actions.close",
					["<esc>"] = "actions.close",
					["q"] = "actions.close",

					-- navigation
					["<CR>"] = "actions.select",
					["<Tab>"] = "actions.preview",
					["<C-v>"] = "actions.select_vsplit",
					["<C-s>"] = "actions.select_split",

					-- dirs
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",

					-- toggles
					["th"] = "actions.toggle_hidden",
					["ts"] = "actions.change_sort",
					["tt"] = "actions.toggle_trash",

					-- g actions
					["gr"] = "actions.refresh",
					["gx"] = "actions.open_external",
					["gy"] = "actions.copy_entry_path",
				},
				use_default_keymaps = false,
				view_options = {
					show_hidden = true,
				},
				float = {
					padding = 8,
					border = "single",
				},
			})

			-- vim.keymap.set("n", "<leader>e", function()
			-- 	oil.toggle_float()
			-- end, { desc = "Oil (Float)" })
			vim.keymap.set("n", "<leader>e", function()
				oil.open()
			end, { desc = "Oil" })
		end,
	},
}
