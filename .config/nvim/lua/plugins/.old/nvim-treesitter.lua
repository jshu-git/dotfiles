return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"kdl",

				"rust",
				"python",
			},
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
