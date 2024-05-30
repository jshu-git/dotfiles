return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
		vim.keymap.set("n", "<leader>tc", "<cmd>ColorizerToggle<CR>", { desc = "Toggle Colorizer" })
	end,
}
