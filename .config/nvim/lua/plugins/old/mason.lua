return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "single",
				height = 0.8,
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {},
		})

		vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Mason" })
	end,
}
