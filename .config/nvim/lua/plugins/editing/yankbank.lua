return {
	"ptdewey/yankbank-nvim",
	config = function()
		require("yankbank").setup({
			max_entries = 9,
			-- sep = "",
			-- num_behavior = "jump",
		})
		vim.keymap.set("n", "<leader>y", "<cmd>YankBank<CR>")
	end,
}
