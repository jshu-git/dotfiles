local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>")

require("lazy").setup({
	"github/copilot.vim",
	"tpope/vim-sleuth",
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
					--- @usage 'rose-pine' | 'rose-pine-alt'
					theme = "rose-pine",
				},
				{ section_separators = "", component_separators = "" },
				lualine_x = { "encoding", "filetype" },
			})
		end,
	},
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
			vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
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
		},
		keys = {
			-- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{
				"<c-s>",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
			require("which-key").register({
				["<leader>f"] = { name = "Find...", _ = "which_key_ignore" },
				["<leader>t"] = { name = "Toggle...", _ = "which_key_ignore" },
				["<leader>m"] = { name = "Menu...", _ = "which_key_ignore" },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"html",
					"json",
					"lua",
					"luadoc",
					"markdown",
					"vim",
					"vimdoc",
					"python",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				-- incremental_selection = {
				-- 	enable = true,
				-- 	keymaps = {
				-- 		init_selection = "<C-s>",
				-- 		node_incremental = "<C-s>",
				-- 		scope_incremental = false,
				-- 		node_decremental = "<C-S-s>",
				-- 	},
				-- },
			})
		end,
	},
	require("plugins.nvim-tree"),
	require("plugins.telescope"),
	require("plugins.nvim-cmp"),
	require("plugins.lspconfig"),
})
