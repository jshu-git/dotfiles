return {
	{
		"j-morano/buffer_manager.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("buffer_manager").setup({
				select_menu_item_commands = {
					v = {
						key = "<C-v>",
						command = "vsplit",
					},
					h = {
						key = "<C-s>",
						command = "split",
					},
				},
				loop_nav = false,
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			})

			local ui = require("buffer_manager.ui")
			vim.keymap.set("n", "<Tab>", ui.nav_next)
			vim.keymap.set("n", "<S-Tab>", ui.nav_prev)
			vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu, { desc = "Buffer Manager" })
		end,
	},

	{
		"echasnovski/mini.bufremove",
		config = function()
			local mini = require("mini.bufremove")
			mini.setup()

			vim.keymap.set("n", "<leader>x", function()
				mini.delete(0, false)
			end, { desc = "Delete Buffer" })
			vim.keymap.set("n", "<leader>X", function()
				mini.delete(0, false)
				vim.cmd("silent! close")
			end, { desc = "Delete Buffer and Window" })
		end,
	},

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	event = "BufReadPre",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		local bufferline = require("bufferline")
	-- 		bufferline.setup({
	-- 			options = {
	-- 				style_preset = bufferline.style_preset.minimal,
	-- 				themable = false,
	-- 				indicator = {
	-- 					style = "none",
	-- 				},
	-- 				diagnostics = "nvim_lsp",
	-- 				show_buffer_close_icons = false,
	-- 				show_close_icon = false,
	-- 				separator_style = { "", "" },
	-- 				always_show_bufferline = true,
	-- 			},
	-- 		})
	-- 		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
	-- 		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
	-- 		vim.keymap.set("n", "<leader><Tab>", "<cmd>BufferLineMoveNext<CR>")
	-- 		vim.keymap.set("n", "<leader><S-Tab>", "<cmd>BufferLineMovePrev<CR>")
	-- 	end,
	-- },
}
