return {
	"szw/vim-maximizer",
	config = function()
		vim.keymap.set("n", "<C-w>m", "<cmd>MaximizerToggle<CR>", { desc = "Toggle Maximize" })
	end,
}
