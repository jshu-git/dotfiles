return {
	"echasnovski/mini.clue",
	version = "*",
	config = function()
		local clue = require("mini.clue")
		clue.setup({
			window = {
				delay = 250,
				config = {
					-- width = "auto"
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
					submode_move = true,
					submode_navigate = true,
					submode_resize = true,
				}),
				clue.gen_clues.z(),

				-- leader
				{ mode = "n", keys = "<leader>f", desc = "Find…" },
				{ mode = "n", keys = "<leader>l", desc = "LSP…" },
				{ mode = "n", keys = "<leader>s", desc = "Session…" },
				{ mode = "n", keys = "<leader>t", desc = "Toggle…" },

				-- submodes
				-- unimpaired
				{ mode = "n", keys = "]h", postkeys = "]" },
				{ mode = "n", keys = "[h", postkeys = "[" },
				{ mode = "n", keys = "]d", postkeys = "]" },
				{ mode = "n", keys = "[d", postkeys = "[" },
				{ mode = "n", keys = "]]", postkeys = "]" },
				{ mode = "n", keys = "[]", postkeys = "]" },
				{ mode = "n", keys = "[[", postkeys = "[" },
				{ mode = "n", keys = "][", postkeys = "[" },
				-- window
				{ mode = "n", keys = "<C-w>=", postkeys = "<C-w>" },
				{ mode = "n", keys = "<C-w>-", postkeys = "<C-w>" },
				{ mode = "n", keys = "<C-w>_", postkeys = "<C-w>" },
				{ mode = "n", keys = "<C-w>+", postkeys = "<C-w>" },
			},
		})

		-- window keymaps
		vim.keymap.set("n", "<C-w><", "<nop>")
		vim.keymap.set("n", "<C-w>>", "<nop>")
		vim.keymap.set("n", "<C-w>0", "<C-w>=", { desc = "Reset Window Size" })
		-- -/= for width, _/+ for height
		vim.keymap.set("n", "<C-w>-", "<C-w><", { desc = "Decrease width" })
		vim.keymap.set("n", "<C-w>=", "<C-w>>", { desc = "Increase width" })
		vim.keymap.set("n", "<C-w>_", "<C-w>-", { desc = "Decrease height" })
		-- vim.keymap.set("n", "<C-w>+", "<C-w>+", { desc = "Increase Height" })
		vim.keymap.set("n", "<C-w>V", "<C-w>v<C-w>h", { desc = "Split Right (No Focus)" })
		vim.keymap.set("n", "<C-w>S", "<C-w>s<C-w>k", { desc = "Split Below (No Focus)" })

		-- highlights
		vim.api.nvim_set_hl(0, "MiniClueTitle", { link = "MiniClueBorder" })
	end,
}
