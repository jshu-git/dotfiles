local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>")

require("lazy").setup({
	-- helpers
	"github/copilot.vim",
	"tpope/vim-sleuth",
	{
		"numToStr/Comment.nvim",
		opts = {
			toggler = {
				line = "<C-c>",
				block = "<leader>c",
			},
			opleader = {
				line = "<C-c>",
				block = "<leader>c",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 500,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
				},
			})
		end,
	},

	-- movement
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			labels = "abcdefghijklmnopqrstuvwxyz",
			modes = {
				char = {
					jump_labels = true,
				},
			},
			label = {
				-- uppercase = false,
			},
		},
			-- stylua: ignore
			keys = {
				{ "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
				{ "<leader>J", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash (Treesitter)" },
				-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
				-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
				-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
			},
	},
	{
		"otavioschwanck/arrow.nvim",
		opts = {
			always_show_path = true,
			-- hide_handbook = true,
			mappings = {
				edit = "e",
				delete_mode = "d",
				clear_all_items = "X",
				toggle = "a",
				open_vertical = "\\",
				open_horizontal = "-",
				quit = "<esc>",
				remove = "x",
				next_item = "]",
				prev_item = "[",
			},
			window = {
				border = "single",
			},
			per_buffer_config = {
				lines = 2,
			},
			separate_save_and_remove = true,
			leader_key = "m",
			buffer_leader_key = "`",
		},
	},

	-- appearance
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				dim_inactive_windows = true,
				styles = {
					transparency = true,
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
		name = "rose-pine",
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "ColorScheme",
		config = function()
			require("lualine").setup({
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_c = { { "filename", path = 3 } },
					lualine_x = { "encoding", "filetype" },
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "▏" },
			scope = { enabled = false },
		},
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					tab_size = 10,
					-- separator_style = "thin",
					always_show_bufferline = true,
				},
			})
			vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
			vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
			vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				current_line_blame = true,
				current_line_blame_formatter = "<author> (<author_time:%R>) - <summary>",
			})
			vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame" })
		end,
	},

	-- big plugins
	require("plugins.which-key"),
	require("plugins.nvim-tree"),
	require("plugins.telescope"),
	require("plugins.nvim-treesitter"),
	require("plugins.nvim-cmp"),
	require("plugins.lspconfig"),
})
