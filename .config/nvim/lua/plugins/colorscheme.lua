return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				-- transparent = true,
				color_overrides = {
					vscPopupBack = "#1f1f1f",
				},
			})
			vim.cmd.colorscheme("vscode")

			-- defaults
			vim.api.nvim_set_hl(0, "CursorLine", { bg = c.vscLeftMid })
			vim.api.nvim_set_hl(0, "Directory", { fg = c.vscBlue })
			-- copilot
			vim.api.nvim_set_hl(0, "CopilotSuggestion", { link = "NonText" })
			vim.api.nvim_set_hl(0, "CopilotAnnotation", { link = "NonText" })
			vim.api.nvim_set_hl(0, "NeoCodeiumSuggestion", { link = "NonText" })
			vim.api.nvim_set_hl(0, "NeoCodeiumLabel", { link = "Search" })
			-- mini
			vim.api.nvim_set_hl(0, "MiniClueTitle", { link = "MiniClueBorder" })
			vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "MiniFilesBorder" })
			vim.api.nvim_set_hl(0, "MiniFilesTitle", { link = "MiniFilesBorder" })
			vim.api.nvim_set_hl(0, "MiniJump", { link = "Search" })
			vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickBorder" })
			vim.api.nvim_set_hl(0, "MiniPickBorderText", { link = "MiniPickBorder" })
			-- aerial
			vim.api.nvim_set_hl(0, "AerialLine", { link = "Search" })
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
