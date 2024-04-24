return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					auto_refresh = true,
					layout = {
						position = "right",
						ratio = 0.4,
					},
				},
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<Tab>",
					},
				},
				filetypes = {
					yaml = true,
					markdown = true,
					gitcommit = true,
					["."] = true,
				},
			})
		end,
	},

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
					-- python = { "isort", "black" },
					["*"] = { "codespell" },
					["_"] = { "trim_whitespace" },
				},
			})
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SplitWidth = 50
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_TreeNodeShape = "·"
			vim.g.undotree_TreeVertShape = "│"
			vim.g.undotree_ShortIndicators = 1
			vim.g.undotree_HelpLine = 0
			vim.g.undotree_CursorLine = 0
			vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo Tree" })
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

	{
		"gbprod/substitute.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local substitute = require("substitute")
			substitute.setup()
			vim.keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
			vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
			vim.keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
			vim.keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
		end,
	},

	{
		"ptdewey/yankbank-nvim",
		config = function()
			require("yankbank").setup({
				max_entries = 9,
				-- sep = "",
				-- num_behavior = "jump",
			})
			vim.keymap.set("n", "<leader>y", "<cmd>YankBank<CR>")
		end,
	},
}
