return {
	{
		"stevearc/oil.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local oil = require("oil")

			oil.setup({
				delete_to_trash = true,
				keymaps = {
					["?"] = "actions.show_help",

					-- navigation
					["<CR>"] = "actions.select",
					["<esc>"] = "actions.close",
					["<Tab>"] = "actions.preview",
					["<C-\\>"] = "actions.select_vsplit",
					["<C-->"] = "actions.select_split",

					-- dirs
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",

					-- toggles
					["th"] = "actions.toggle_hidden",
					["tt"] = "actions.toggle_trash",
					["ts"] = "actions.change_sort",

					-- g actions
					["gr"] = "actions.refresh",
					["gx"] = "actions.open_external",
					["gy"] = "actions.copy_entry_path",
				},
				use_default_keymaps = false,
				view_options = {
					show_hidden = true,
				},
			})

			vim.keymap.set("n", "<leader>e", function()
				oil.toggle_float()
			end, { desc = "Explorer (Float)" })
			vim.keymap.set("n", "<leader>E", function()
				oil.open()
			end, { desc = "Explorer" })
		end,
	},
}
