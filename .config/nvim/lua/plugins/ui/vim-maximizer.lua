return {
	"0x00-ketsu/maximizer.nvim",
	config = function()
		local maximizer = require("maximizer")
		maximizer.setup()
		vim.keymap.set("n", "<C-w>m", maximizer.toggle, { desc = "Toggle Maximize" })
		vim.keymap.set("n", "<C-e>", maximizer.toggle, { desc = "Toggle Maximize" })
	end,
}
