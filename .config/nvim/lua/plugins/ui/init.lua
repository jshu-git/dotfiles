return {
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

	{ "AndreM222/copilot-lualine" },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = "otavioschwanck/arrow.nvim",
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
					disabled_filetypes = { "help", "undotree", "diff", "alpha" },
				},
				sections = {
					lualine_c = {
						{ arrow, padding = { left = 1 } },
						{ "filename", path = 3 },
					},
					lualine_x = {
						{
							"copilot",
							symbols = {
								status = {
									icons = {
										unknown = "",
									},
								},
								show_colors = true,
								padding = { right = 0 },
							},
							"filetype",
						},
					},
				},
				inactive_sections = {
					lualine_c = {},
					lualine_x = {},
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

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		require("bufferline").setup({
	-- 			options = {
	-- 				indicator = {
	-- 					style = "none",
	-- 				},
	-- 				tab_size = 10,
	-- 				separator_style = { "", "" },
	-- 				always_show_bufferline = true,
	-- 				show_tab_indicators = false,
	-- 			},
	-- 		})
	-- 		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
	-- 		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
	-- 	end,
	-- },
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

	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = "BufReadPost",
		config = function()
			local ufo = require("ufo")
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.keymap.set("n", "zR", ufo.openAllFolds)
			vim.keymap.set("n", "zM", ufo.closeAllFolds)
			ufo.setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
			})
		end,
	},

	{
		"tummetott/reticle.nvim",
		event = "VeryLazy",
		opts = {
			on_startup = {
				cursorcolumn = true,
			},
			disable_in_insert = false,
			disable_in_diff = false,
			ignore = {
				cursorcolumn = {
					"NvimTree",
					"TelescopePrompt",
				},
			},
			never = {
				cursorline = {
					"alpha",
				},
				cursorcolumn = {
					"alpha",
				},
			},
		},
	},

	require("plugins.ui.alpha"),
}
