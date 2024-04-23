return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
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
			-- },
			-- 	},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["il"] = "@loop.inner",
						["al"] = "@loop.outer",
						["ii"] = "@conditional.inner",
						["ai"] = "@conditional.outer",
						["aa"] = "@parameter.outer", -- a for argument
						["ia"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]l"] = "@loop.outer",
						["]i"] = "@conditional.outer",
						["]a"] = "@parameter.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[l"] = "@loop.outer",
						["[i"] = "@conditional.outer",
						["[a"] = "@parameter.outer",
					},
				},
			},
		})
	end,
}