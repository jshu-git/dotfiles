return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({
			keymaps = {
				replace = "<leader>R",
			},
		})
		vim.keymap.set("n", "<leader>r", "<cmd>GrugFar<CR>", { desc = "Find and Replace" })
	end,
}
