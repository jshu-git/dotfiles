return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local colors = require("vscode.colors").get_colors()
			require("vscode").setup({
				transparent = true,
				-- https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/theme.lua
				group_overrides = {
					CopilotSuggestion = { link = "NonText" },
					CopilotAnnotation = { link = "NonText" },
					Directory = { fg = colors.vscBlue }, -- MiniFilesDirectory = { fg = colors.vscBlue },

					-- mini
					MiniClueTitle = { link = "MiniClueBorder" },
					MiniFilesCursorLine = { link = "Comment" },
					MiniFilesTitleFocused = { link = "MiniFilesBorder" },
					MiniFilesTitle = { link = "MiniFilesBorder" },
					-- MiniIndentscopeSymbol = { link = "NonText" },
					MiniPickPrompt = { link = "MiniPickBorder" },
					MiniPickBorderText = { link = "MiniPickBorder" },
				},
			})
			vim.cmd.colorscheme("vscode")
		end,
	},

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

	-- {
	-- 	"miversen33/sunglasses.nvim",
	-- 	config = function()
	-- 		require("sunglasses").setup({
	-- 			filter_percent = 0.33,
	-- 		})
	-- 	end,
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
