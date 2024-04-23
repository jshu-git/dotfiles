local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>")

require("lazy").setup({
	-- editing
	"github/copilot.vim",
	"tpope/vim-sleuth",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
			vim.keymap.set("n", "<C-c>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle Comment" })
			vim.keymap.set("x", "<C-c>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle Comment" })
		end,
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
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo Tree" })
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SplitWidth = 50
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_TreeNodeShape = "·"
			vim.g.undotree_TreeVertShape = "│"
			vim.g.undotree_ShortIndicators = 1
			vim.g.undotree_HelpLine = 0
			vim.g.undotree_CursorLine = 0
		end,
	},
	{
		"fedepujol/move.nvim",
		config = function()
			require("move").setup()
			vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", { desc = "Move Line Down" })
			vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", { desc = "Move Line Up" })
			vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", { desc = "Move Lines Down" })
			vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", { desc = "Move Lines Up" })
		end,
	},

	-- movement
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
				zindex = 5000,
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
				"F",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter({
						label = { before = true, after = false },
					})
				end,
				desc = "Flash (Treesitter)",
			},
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
				clear_all_items = "D",
				toggle = "m",
				open_vertical = "\\",
				open_horizontal = "-",
				quit = "<esc>",
			},
			window = {
				border = "single",
			},
			per_buffer_config = {
				lines = 2,
				sort_automatically = false,
			},
			leader_key = "M",
			buffer_leader_key = "m",
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
		dependences = "otavioschwanck/arrow.nvim",
		event = "ColorScheme",
		config = function()
			-- arrow status
			local function arrow()
				return require("arrow.statusline").text_for_statusline_with_icons()
			end
			require("lualine").setup({
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_c = {
						{ arrow, padding = { left = 1 } },
						{ "filename", path = 3 },
					},
					lualine_x = {
						"filetype",
					},
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
					indicator = {
						style = "none",
					},
					tab_size = 10,
					separator_style = { "", "" },
					always_show_bufferline = true,
					show_tab_indicators = false,
				},
			})
			vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
			vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				current_line_blame = true,
				current_line_blame_formatter = "<author> (<author_time:%R>) - <summary>",
			})
			vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame" })
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	},
	{
		"szw/vim-maximizer",
		config = function()
			vim.keymap.set("n", "<leader>tm", "<cmd>MaximizerToggle<CR>", { desc = "Toggle Maximize" })
		end,
	},

	-- sessions
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

	-- big plugins
	require("plugins.alpha"),
	require("plugins.which-key"),
	require("plugins.oil"),
	require("plugins.telescope"),
	require("plugins.nvim-treesitter"),
	require("plugins.nvim-cmp"),
	require("plugins.lspconfig"),
})
