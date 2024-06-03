return {
	"sontungexpt/url-open",
	branch = "mini",
	event = "VeryLazy",
	config = function()
		require("url-open").setup({
			highlight_url = {
				cursor_move = { enabled = false },
			},
		})
		vim.keymap.set("n", "gx", "<cmd>URLOpenUnderCursor<CR>")
	end,
}
