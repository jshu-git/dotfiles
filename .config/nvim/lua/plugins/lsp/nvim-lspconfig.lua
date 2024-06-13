return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		{ "echasnovski/mini.extra", opts = {} },
		-- ui
		{
			"rmagatti/goto-preview",
			opts = {
				width = math.floor(0.75 * vim.o.columns),
				height = math.floor(0.5 * vim.o.lines),
				border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				preview_window_title = { position = "center" },
			},
		},
		-- cmp
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				local extra = require("mini.extra")

				-- lsp
				vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "LSP: Hover Signature" })
				-- map("gs", vim.lsp.buf.hover, "Hover")
				map("gs", function()
					if not require("ufo").peekFoldedLinesUnderCursor() then
						vim.lsp.buf.hover()
					end
				end, "Hover")
				map("ga", vim.lsp.buf.code_action, "Code Action")
				-- map("gI", function()
				-- 	extra.pickers.lsp({ scope = "implementation" })
				-- end, "Goto Implementation")
				-- map("gt", function()
				-- 	extra.pickers.lsp({ scope = "type_definition" })
				-- end, "Goto Type Definition")

				map("gd", require("goto-preview").goto_preview_definition, "Goto Definition (Preview)")
				map("gD", function()
					extra.pickers.lsp({ scope = "definition" })
				end, "Goto Definition (Pick)")
				-- map("gD", function()
				-- 	extra.pickers.lsp({ scope = "declaration" })
				-- end, "Goto Declaration")

				map("gr", function()
					extra.pickers.lsp({ scope = "references" })
				end, "Goto References")
				map("gR", vim.lsp.buf.rename, "Rename Variable")

				-- diagnostics
				map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
				map("<leader>fd", function()
					extra.pickers.diagnostic({ scope = "current" })
				end, "Diagnostics (Buffer)")
				map("<leader>fD", extra.pickers.diagnostic, "Diagnostics (All)")
				map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
				map("]d", vim.diagnostic.goto_next, "Next Diagnostic")

				-- lsp menu
				map("<leader>li", "<cmd>LspInfo<CR>", "Info")
				map("<leader>lr", "<cmd>LspRestart<CR>", "Restart")

				-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L510
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- toggle inlay hints
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						---@diagnostic disable-next-line: missing-parameter
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "Toggle Inlay Hints")
				end
			end,
		})

		-- servers https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
		local servers = {
			taplo = {},
			-- typos_lsp = {
			-- 	diagnosticSeverity = "Warning",
			-- },
			lua_ls = {
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
						diagnostics = {
							disable = { "missing-fields" },
							globals = { "vim" },
						},
					},
				},
			},

			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
			-- basedpyright = {
			-- 	settings = {
			-- 		basedpyright = {
			-- 			analysis = {
			-- 				typeCheckingMode = "off",
			-- 			},
			-- 		},
			-- 		python = {
			-- 			pythonPath = "/u/jshu/p4/cacl3/test/tools/python/nate/rhel7-3.12/bin/python",
			-- 		},
			-- 	},
			-- },
		}

		-- lspconfig
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- enable cmp capabilities
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		-- enable folding capabilities
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local lspconfig = require("lspconfig")
		for server, config in pairs(servers) do
			-- config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end

		-- ui
		require("lspconfig.ui.windows").default_options.border = "single"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "single",
		})
		vim.diagnostic.config({
			float = { border = "single", severity_sort = true },
			severity_sort = true,
			virtual_text = false,
			-- jump = {float = true, wrap = false}
		})
		local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "󰋽" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
