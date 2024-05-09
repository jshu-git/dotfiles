return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- mason
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		-- ui
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
		-- cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("ga", vim.lsp.buf.code_action, "Code Action")
				map("gs", vim.lsp.buf.hover, "Hover Documentation")
				map("gS", vim.lsp.buf.signature_help, "Hover Signature")
				map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
				-- map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				-- map("gt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")

				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				-- map("gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")
				-- map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gR", vim.lsp.buf.rename, "Rename Variable")

				-- symbols
				map("<leader>fs", require("telescope.builtin").lsp_document_symbols, "Goto Symbols")
				map("<leader>fS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Goto Workspace Symbols")

				map("[d", vim.diagnostic.goto_prev, "Next Diagnostic")
				map("]d", vim.diagnostic.goto_next, "Previous Diagnostic")

				-- clear highlights when moving cursor
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- enable cmp capabilities
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- server configurations
		local servers = {
			-- pyright = {},
			-- rust_analyzer = {},
			lua_ls = {
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
						-- completion = {
						-- 	callSnippet = "Replace",
						-- },
						diagnostics = {
							disable = { "missing-fields" },
							globals = { "vim" },
						},
					},
				},
			},
		}

		-- mason
		require("mason").setup({
			ui = {
				border = "single",
				height = 0.8,
			},
		})
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		})
		vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Mason" })

		-- ui
		require("lspconfig.ui.windows").default_options.border = "single"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "single",
		})
		vim.diagnostic.config({
			float = {
				border = "single",
			},
		})
	end,
}
