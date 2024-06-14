return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local c = require("vscode.colors").get_colors()

			require("vscode").setup({
				-- transparent = true,
				group_overrides = {
					Directory = { fg = c.vscBlue },

					-- copilot
					CopilotSuggestion = { link = "NonText" },
					CopilotAnnotation = { link = "NonText" },
					NeoCodeiumSuggestion = { link = "NonText" },
					NeoCodeiumLabel = { link = "Search" },

					-- mini
					MiniClueTitle = { link = "MiniClueBorder" },
					MiniFilesTitleFocused = { link = "MiniFilesBorder" },
					MiniFilesTitle = { link = "MiniFilesBorder" },
					MiniJump = { link = "Search" },
					MiniPickPrompt = { link = "MiniPickBorder" },
					MiniPickBorderText = { link = "MiniPickBorder" },

					-- aerial
					AerialLine = { link = "Search" },

					StatusLine = { bg = "white" },
					StatusLineNC = { bg = "white" },
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
	-- 	"aktersnurra/no-clown-fiesta.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("no-clown-fiesta").setup({
	-- 			transparent = false,
	-- 		})
	-- 	end,
	-- },
}
