return {
	"FabijanZulj/blame.nvim",
	config = function()
		require("blame").setup()
		vim.keymap.set("n", "<leader>tb", "<cmd>BlameToggle window<CR>", { desc = "Toggle Blame (Window)" })
	end,
}
