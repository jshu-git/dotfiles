return {
	"FabijanZulj/blame.nvim",
	config = function()
		require("blame").setup()
		vim.keymap.set("n", "<leader>tb", "<cmd>BlameToggle virtual<CR>", { desc = "Toggle Blame (Virtual)" })
		vim.keymap.set("n", "<leader>tB", "<cmd>BlameToggle window<CR>", { desc = "Toggle Blame (Window)" })
	end,
}
