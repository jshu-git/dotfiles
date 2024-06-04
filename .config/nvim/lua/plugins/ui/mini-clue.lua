return {
	"echasnovski/mini.clue",
	config = function()
		local clue = require("mini.clue")
		clue.setup({
			window = {
				delay = 250,
				config = {
					width = math.floor(0.23175 * vim.o.columns),
				},
			},
			triggers = {
				-- g
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- windows
				{ mode = "n", keys = "<C-w>" },

				-- z
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },

				-- registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- leader
				{ mode = "n", keys = "<leader>" },
				{ mode = "x", keys = "<leader>" },

				-- unimpaired
				{ mode = "n", keys = "]" },
				{ mode = "n", keys = "[" },

				-- surround/substitute
				{ mode = "n", keys = "s" },
				{ mode = "x", keys = "s" },
			},

			clues = {
				clue.gen_clues.g(),
				clue.gen_clues.registers({ show_contents = true }),
				clue.gen_clues.windows({
					submode_resize = true,
				}),
				clue.gen_clues.z(),

				-- leader
				{ mode = "n", keys = "<leader>f", desc = "Find…" },
				{ mode = "n", keys = "<leader>l", desc = "LSP…" },
				{ mode = "n", keys = "<leader>s", desc = "Session…" },
				{ mode = "n", keys = "<leader>t", desc = "Toggle…" },
				{ mode = "n", keys = "<leader>g", desc = "Git…" },
				{ mode = "x", keys = "<leader>g", desc = "Git…" },
				{ mode = "n", keys = "<leader>d", desc = "Quick Edit…" },

				-- submodes
				{ mode = "n", keys = "][", postkeys = "[" },
				{ mode = "n", keys = "]]", postkeys = "]" },
				{ mode = "n", keys = "[[", postkeys = "[" },
				{ mode = "n", keys = "[]", postkeys = "]" },
				-- window
				{ mode = "n", keys = "<C-w>=", postkeys = "<C-w>" },
				{ mode = "n", keys = "<C-w>-", postkeys = "<C-w>" },
				{ mode = "n", keys = "<C-w>_", postkeys = "<C-w>" },
				{ mode = "n", keys = "<C-w>+", postkeys = "<C-w>" },
			},
		})

		-- highlights
		-- vim.api.nvim_set_hl(0, "MiniClueTitle", { link = "MiniClueBorder" })
	end,
}
