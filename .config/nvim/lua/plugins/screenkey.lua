return {
	"NStefan002/screenkey.nvim",
	version = "*",
	config = function()
		require("screenkey").setup({
			group_mappings = false,
			show_leader = true,
		})
		vim.keymap.set("n", "<leader>tk", "<cmd>Screenkey<CR>", { desc = "Toggle Screenkey" })
	end,
}
