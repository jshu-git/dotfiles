return {
	"echasnovski/mini.clue",
	config = function()
		local clue = require("mini.clue")
		clue.setup({
			window = {
				delay = 250,
				width = math.floor(0.3 * vim.o.columns),
			},
			triggers = {
				{ mode = "n", keys = "<leader>" },
				{ mode = "x", keys = "<leader>" },
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },
				{ mode = "n", keys = "<C-w>" },
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },

				-- unimpaired
				{ mode = "n", keys = "]" },
				{ mode = "n", keys = "[" },

				-- surround/substitute operators
				{ mode = "n", keys = "s" },
				{ mode = "x", keys = "s" },
			},
			clues = {
				-- clue.gen_clues.g(),
				clue.gen_clues.windows(),
				clue.gen_clues.registers(),
				clue.gen_clues.z(),

				-- leader
				{ mode = "n", keys = "<leader>f", desc = "Find…" },
				{ mode = "n", keys = "<leader>l", desc = "LSP…" },
				{ mode = "n", keys = "<leader>t", desc = "Toggle…" },
				{ mode = "n", keys = "<leader>g", desc = "Git…" },
				{ mode = "x", keys = "<leader>g", desc = "Git…" },
				{ mode = "n", keys = "<leader>a", desc = "GPT…" },
				{ mode = "x", keys = "<leader>a", desc = "GPT…" },
				{ mode = "n", keys = "<leader>r", desc = "Replace…" },
				{ mode = "x", keys = "<leader>r", desc = "Replace…" },
				{ mode = "n", keys = "<leader>m", desc = "Misc…" },

				-- submodes
				-- { mode = "n", keys = "zj", postkeys = "z" },
				-- { mode = "n", keys = "zk", postkeys = "z" },
				{ mode = "n", keys = "zm", postkeys = "z" },
				{ mode = "n", keys = "zr", postkeys = "z" },
				{ mode = "n", keys = "zo", postkeys = "z" },
				{ mode = "n", keys = "zc", postkeys = "z" },
			},
		})
	end,
}
