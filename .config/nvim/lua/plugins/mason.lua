return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				border = "single",
				height = 0.8,
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				-- "pyright",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				-- "isort",
				-- "black",
			},
		})

		vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>")
	end,
}
