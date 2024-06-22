return {
	"nvim-treesitter/nvim-treesitter",
	cond = vim.env.SSH_CLIENT == nil,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"bash",
				"kdl",
				"json",
				"rust",
				"python",
			},
			highlight = { enable = true },
			-- indent = { enable = true },
		})
	end,
}
