return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			current_line_blame_opts = {
				virt_text_pos = "right_align",
				delay = 50,
				ignore_whitespace = true,
			},
			current_line_blame = true,
			current_line_blame_formatter = "<author> (<author_time:%R>) - <summary>",
		})
		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame" })
	end,
}
