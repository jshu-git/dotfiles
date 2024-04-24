return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			labels = "12345abcdefghijklmnopqrstuvwxyz",
			jump = {
				autojump = true,
			},
			highlight = {
				backdrop = false,
			},
			modes = {
				search = {
					enabled = false,
				},
				char = {
					enabled = false,
				},
				treesitter = {
					labels = "12345abcdefghijklmnopqrstuvwxyz",
				},
			},
			prompt = {
				prefix = { { "⚡Flash ⚡", "FlashPromptIcon" } },
			},
		},
		keys = {
			{
				"f",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"t",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						jump = { offset = -1 },
						label = { before = true, after = false },
					})
				end,
				desc = "Flash",
			},
			{
				"F",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter({
						label = {
							before = true,
							after = false,
							rainbow = {
								enabled = true,
							},
						},
					})
				end,
				desc = "Flash (Treesitter)",
			},
		},
	},

	-- {
	-- 	"otavioschwanck/arrow.nvim",
	-- 	opts = {
	-- 		always_show_path = true,
	-- 		-- hide_handbook = true,
	-- 		mappings = {
	-- 			edit = "e",
	-- 			delete_mode = "d",
	-- 			clear_all_items = "D",
	-- 			toggle = "m",
	-- 			open_vertical = "\\",
	-- 			open_horizontal = "-",
	-- 			quit = "<esc>",
	-- 		},
	-- 		window = {
	-- 			border = "single",
	-- 		},
	-- 		per_buffer_config = {
	-- 			lines = 2,
	-- 			sort_automatically = false,
	-- 		},
	-- 		leader_key = "M",
	-- 		buffer_leader_key = "m",
	-- 	},
	-- },

	{
		"j-morano/buffer_manager.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("buffer_manager").setup({
				{
					select_menu_item_commands = {
						edit = {
							key = "<CR>",
							command = "edit",
						},
						v = {
							key = "<C-\\>",
							command = "vsplit",
						},
						h = {
							key = "<C-->",
							command = "split",
						},
					},
					-- focus_alternate_buffer = false,
				},
			})
			local ui = require("buffer_manager.ui")
			vim.keymap.set("n", "<leader><leader>", ui.toggle_quick_menu, { desc = "Buffers" })
			vim.keymap.set("n", "<Tab>", ui.nav_next)
			vim.keymap.set("n", "<S-Tab>", ui.nav_prev)
		end,
	},

	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				auto_save_enabled = true,
				auto_restore_enabled = false,
				auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/", "/" },
			})
			vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
			vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
			vim.keymap.set("n", "<leader>sw", "<cmd>SessionSave<CR>", { desc = "Save Session" })
			vim.keymap.set(
				"n",
				"<leader>fs",
				require("auto-session.session-lens").search_session,
				{ desc = "Sessions" }
			)
		end,
	},
}
