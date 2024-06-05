return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			dim_inactive_windows = true,
	-- 			styles = {
	-- 				bold = false,
	-- 				italic = false,
	-- 			},
	-- 		})
	-- 	end,
	-- 	name = "rose-pine",
	-- },

	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local colors = require("vscode.colors").get_colors()
			require("vscode").setup({
				transparent = false,
				italic_comments = false,
				-- https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/theme.lua
				group_overrides = {
					CopilotSuggestion = { link = "NonText" },
					CopilotAnnotation = { link = "NonText" },
					Directory = { fg = colors.vscBlue },

					-- mini
					MiniClueTitle = { link = "MiniClueBorder" },
					-- MiniFilesDirectory = { fg = colors.vscBlue },
					MiniFilesTitleFocused = { link = "MiniFilesBorder" },
					MiniFilesTitle = { link = "MiniFilesBorder" },
					MiniIndentscopeSymbol = { link = "NonText" },
					MiniPickPrompt = { link = "MiniPickBorder" },
					MiniPickBorderText = { link = "MiniPickBorder" },

					-- barbar
					-- BufferTabpageFill = { link = "Normal" },

					-- winbar
					-- WinBarNC = { link = "Statusline" },
					-- WinBar = { link = "Statusline" },
				},
			})
			vim.cmd.colorscheme("vscode")
		end,
	},

	-- {
	-- 	"miversen33/sunglasses.nvim",
	-- 	config = function()
	-- 		require("sunglasses").setup({
	-- 			filter_percent = 0.33,
	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"dgox16/oldworld.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },

	-- {
	-- 	"mellow-theme/mellow.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },

	-- {
	-- 	"aktersnurra/no-clown-fiesta.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("no-clown-fiesta").setup({
	-- 			transparent = false,
	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"kdheepak/monochrome.nvim",
	-- 	priority = 1000,
	-- },

	-- {
	-- 	"slugbyte/lackluster.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },
}
