return {
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			dim_inactive_windows = true,
			styles = {
				bold = false,
				italic = false,
				transparency = true,
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
	name = "rose-pine",
}
