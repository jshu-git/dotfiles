return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("ga", vim.lsp.buf.code_action, "Code Action")
				map("gh", vim.lsp.buf.hover, "Hover Documentation")
				map("gj", vim.lsp.buf.signature_help, "Hover Signature")
				map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
				map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				-- map("gt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")

				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				-- map("gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gR", vim.lsp.buf.rename, "Rename Variable")
				map("gs", require("telescope.builtin").lsp_document_symbols, "Goto Symbols")
				map("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Goto Workspace Symbols")

				map("[d", vim.diagnostic.goto_prev, "Next Diagnostic")
				map("]d", vim.diagnostic.goto_next, "Previous Diagnostic")

				-- clear highlights when moving cursor
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		-- mason
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		require("mason").setup({
			ui = {
				border = "single",
				height = 0.8,
			},
		})
		require("mason-tool-installer").setup({})
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})

		-- ui
		require("lspconfig.ui.windows").default_options.border = "single"
		vim.diagnostic.config({
			float = {
				border = "single",
			},
		})

		vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Mason" })
	end,
}
