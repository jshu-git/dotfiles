return {

	"echasnovski/mini.jump2d",
	config = function()
		local jump2d = require("mini.jump2d")
		jump2d.setup({
			labels = "asdfghjklqwertyuiopzxcvbnm",
			mappings = {
				start_jumping = "",
			},
		})

		-- jump to any word
		vim.keymap.set("n", "gw", function()
			local opts = vim.tbl_deep_extend("force", jump2d.builtin_opts.word_start, {
				view = { n_steps_ahead = 1 },
				allowed_lines = { blank = false },
				allowed_windows = { not_current = false },
			})
			jump2d.start(opts)
			vim.api.nvim_command("normal! zz")
		end, { desc = "Jump (Word)" })
	end,
}
