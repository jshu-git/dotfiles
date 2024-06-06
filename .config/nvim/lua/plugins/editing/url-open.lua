return {
	"sontungexpt/url-open",
	branch = "mini",
	event = "VeryLazy",
	cmd = "URLOpenUnderCursor",
	config = function()
		require("url-open").setup()
		vim.keymap.set("n", "gx", "<cmd>URLOpenUnderCursor<CR>", { desc = "Open URL" })
	end,
}
