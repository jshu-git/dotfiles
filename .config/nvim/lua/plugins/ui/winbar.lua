return {
	-- {
	-- 	"echasnovski/mini.tabline",
	-- 	config = function()
	-- 		require("mini.tabline").setup()
	-- 	end,
	-- },

	-- {
	-- 	"ramilito/winbar.nvim",
	-- 	event = "VimEnter",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("winbar").setup({
	-- 			icons = true,
	-- 			diagnostics = false,
	-- 			buf_modified = true,
	-- 			buf_modified_symbol = "●",
	-- 			dim_inactive = {
	-- 				enabled = true,
	-- 				highlight = "NonText",
	-- 				icons = true,
	-- 				name = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("barbar").setup({
				animation = false,
				auto_hide = 0,
				exclude_ft = { "alpha" },
				icons = {
					button = "",
					separator = { left = "", right = "" },
					separator_at_end = false,
					modified = { button = "●" },
					pinned = { button = "", filename = false },
					-- alternate = { filetype = { enabled = false } },
					inactive = { separator = { left = "", right = "" } },
				},
				insert_at_end = true,
				maximum_padding = 1,
				minimum_padding = 1,
			})
			vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>")
			vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>")
			vim.keymap.set("n", "<A-H>", "<cmd>BufferMovePrevious<CR>")
			vim.keymap.set("n", "<A-L>", "<cmd>BufferMoveNext<CR>")
			vim.keymap.set("n", "<A-P>", "<cmd>BufferPin<CR>")
			-- vim.keymap.set("n", "<A-c>", "<cmd>BufferClose<CR>")
			vim.keymap.set("n", "<A-C>", "<cmd>BufferCloseAllButCurrent<CR>")
			vim.keymap.set("n", "gb", "<cmd>BufferPick<CR>")
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

	-- {
	-- 	"j-morano/buffer_manager.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("buffer_manager").setup({
	-- 			{
	-- 				select_menu_item_commands = {
	-- 					v = {
	-- 						key = "<C-s>",
	-- 						command = "vsplit",
	-- 					},
	-- 					h = {
	-- 						key = "<C-v>",
	-- 						command = "split",
	-- 					},
	-- 				},
	-- 				short_file_names = true,
	-- 				loop_nav = false,
	-- 			},
	-- 		})
	-- 		local ui = require("buffer_manager.ui")
	-- 		-- vim.keymap.set("n", "<Tab>", ui.toggle_quick_menu, { desc = "Buffers" })
	-- 		-- vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu, { desc = "Buffers" })
	-- 		-- vim.keymap.set("n", "<Tab>", ui.nav_next, { desc = "Next Buffer" })
	-- 		-- vim.keymap.set("n", "<S-Tab>", ui.nav_prev, { desc = "Previous Buffer" })
	--
	-- 		-- local keys = "12345"
	-- 		-- for i = 1, #keys do
	-- 		-- 	local key = keys:sub(i, i)
	-- 		-- 	vim.keymap.set("n", string.format("<leader>%s", key), function()
	-- 		-- 		ui.nav_file(i)
	-- 		-- 	end, { desc = "Buffer " .. i })
	-- 		-- end
	-- 	end,
	-- },
}
