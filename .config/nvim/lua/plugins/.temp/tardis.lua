return {
	"fredeeb/tardis.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("tardis-nvim").setup()
		vim.keymap.set("n", "<leader>gh", "<cmd>split<CR><cmd>Tardis<CR>", { desc = "Git History (Tardis)" })
	end,
}
