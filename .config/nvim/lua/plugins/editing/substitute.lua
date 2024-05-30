return {
	"gbprod/substitute.nvim",
	config = function()
		require("substitute").setup()
		-- vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
		vim.keymap.set("n", "ss", require("substitute").line, { noremap = true, desc = "Substitute Line" })
		vim.keymap.set("n", "S", require("substitute").eol, { noremap = true, desc = "Substitute EOL" })
		vim.keymap.set("x", "ss", require("substitute").visual, { noremap = true, desc = "Substitute Visual" })
	end,
}
