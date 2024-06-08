return {
	"NStefan002/screenkey.nvim",
	config = function()
		require("screenkey").setup({
			win_opts = {
				width = 25,
				height = 1,
			},
		})
		vim.keymap.set("n", "<leader>tk", "<cmd>Screenkey<CR>", { desc = "Toggle Screenkey" })
	end,
}
