return {
	"famiu/bufdelete.nvim",
	config = function()
		vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<CR>", { desc = "Delete Buffer" })
		vim.keymap.set("n", "<leader>X", "<cmd>Bdelete!<CR>", { desc = "Delete Buffer (Force)" })
	end,
}
