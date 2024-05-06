return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
		vim.keymap.set("n", "<C-c>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle Comment" })
		vim.keymap.set("x", "<C-c>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle Comment" })
	end,
}
