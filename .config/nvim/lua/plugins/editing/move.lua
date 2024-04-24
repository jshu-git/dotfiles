return {
	"fedepujol/move.nvim",
	config = function()
		require("move").setup()
		vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", { desc = "Move Line Down" })
		vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", { desc = "Move Line Up" })
		vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", { desc = "Move Lines Down" })
		vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", { desc = "Move Lines Up" })
	end,
}
