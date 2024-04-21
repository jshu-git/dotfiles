return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"html",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
				"python",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = "<C-s>",
			-- 		node_incremental = "<C-s>",
			-- 		scope_incremental = false,
			-- 		node_decremental = "<C-S-s>",
			-- 	},
			-- },
		})
	end,
}
