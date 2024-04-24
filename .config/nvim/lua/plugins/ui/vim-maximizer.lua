return {
	"szw/vim-maximizer",
	config = function()
		vim.keymap.set("n", "<leader>tm", "<cmd>MaximizerToggle<CR>", { desc = "Toggle Maximize" })
	end,
}
