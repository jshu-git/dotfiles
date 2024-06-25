return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
				end

				require("lsp_signature").on_attach({}, bufnr)
				map("gs", require("pretty_hover").hover, "Hover")
				map("ga", vim.lsp.buf.code_action, "Code Action")
				map("gd", "<cmd>Glance definitions<CR>", "Goto Definition")
				-- map("gD", function()
				-- 	require("mini.extra").pickers.lsp({ scope = "definition" })
				-- end, "Goto Definition (Pick)")
				map("gr", "<cmd>Glance references<CR>", "Goto References")
				vim.keymap.set("n", "gR", function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end, { buffer = bufnr, desc = "LSP: Rename Variable", expr = true })

				-- diagnostics
				map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
				map("<leader>fd", function()
					require("mini.extra").pickers.diagnostic({ scope = "current" })
				end, "Diagnostics (Buffer)")
				map("<leader>fD", function()
					require("mini.extra").pickers.diagnostic({ scope = "all" })
				end, "Diagnostics (All)")
				map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
				map("]d", vim.diagnostic.goto_next, "Next Diagnostic")

				-- lsp menu
				map("<leader>li", "<cmd>LspInfo<CR>", "Info")
				map("<leader>lr", "<cmd>LspRestart<CR>", "Restart")

				-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L510
				local client = vim.lsp.get_client_by_id(args.data.client_id)
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
			marksman = {},
			taplo = {},
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
		-- enable lsp folding capabilities for nvim-ufo
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
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
		vim.diagnostic.config({
			float = {
				border = "single",
				severity_sort = true,
			},
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
