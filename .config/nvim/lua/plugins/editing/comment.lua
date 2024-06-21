return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<C-c>",
				block = "<C-S-c>",
			},
		})

		vim.keymap.set("x", "<C-c>", "<Plug>(comment_toggle_linewise_visual)")
		vim.keymap.set("x", "<C-S-c>", "<Plug>(comment_toggle_blockwise_visual)")
		vim.keymap.set({ "x", "o" }, "ic", require("vim._comment").textobject)
		vim.keymap.set({ "x", "o" }, "ac", require("vim._comment").textobject)
	end,
}
