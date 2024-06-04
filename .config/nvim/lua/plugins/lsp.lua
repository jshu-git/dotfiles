return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/lazydev.nvim", ft = "lua", opts = {} },
			-- ui
			{ "echasnovski/mini.notify", opts = {} },
			{ "Fildo7525/pretty_hover", opts = { border = "single", max_width = 40, max_height = 15 } },
			-- cmp
			{ "hrsh7th/cmp-nvim-lsp" },
			-- lsp
			{ "echasnovski/mini.extra" },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- lsp
					map("ga", vim.lsp.buf.code_action, "Code Action")
					map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
					map("gi", function()
						require("mini.extra").pickers.lsp({ scope = "implementation" })
					end, "Goto Implementation")
					map("gt", function()
						require("mini.extra").pickers.lsp({ scope = "type_definition" })
					end, "Goto Type Definition")

					map("gd", function()
						require("mini.extra").pickers.lsp({ scope = "definition" })
					end, "Goto Definition")
					map("gD", function()
						require("mini.extra").pickers.lsp({ scope = "declaration" })
					end, "Goto Declaration")

					map("gs", require("pretty_hover").hover, "Hover Documentation")
					map("gS", vim.lsp.buf.signature_help, "Hover Signature")

					map("gr", function()
						require("mini.extra").pickers.lsp({ scope = "references" })
					end, "Goto References")
					map("gR", vim.lsp.buf.rename, "Rename Variable")

					map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
					map("]d", vim.diagnostic.goto_next, "Next Diagnostic")

					-- lsp menu
					map("<leader>li", "<cmd>LspInfo<CR>", "Info")
					map("<leader>lL", "<cmd>LspLog<CR>", "LSP Log")
					map("<leader>lr", "<cmd>LspRestart<CR>", "Restart")

					-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L510
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						-- toggle inlay hints
						if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
							map("<leader>th", function()
								---@diagnostic disable-next-line: missing-parameter
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
							end, "Toggle Inlay Hints")
						end
					end
				end,
			})

			-- servers https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
			local servers = {
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
				ruff = {
					settings = {},
				},
				-- basedpyright = {
				-- 	settings = {
				-- 		basedpyright = {
				-- 			analysis = {
				-- 				typeCheckingMode = "basic",
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
				float = { border = "single" },
				virtual_text = false,
				-- jump = {float = true, wrap = false}
			})
			local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "󰋽" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	},

	{
		"RaafatTurki/corn.nvim",
		config = function()
			require("corn").setup({
				icons = { error = "󰅚", warn = "󰀪", hint = "󰌶", info = "󰋽" },
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					json = { "prettier" },
					markdown = { "prettier" },
					sh = { "shfmt" },
					zsh = { "shfmt" },
					-- ["*"] = { "codespell", "trim_whitespace" },
				},
				-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_fallback = true }
				end,
			})

			-- toggle autoformatting
			vim.g.disable_autoformat = false
			vim.api.nvim_create_user_command("ToggleAutoformatting", function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
			end, {
				desc = "Toggle Autoformatting",
			})
			vim.keymap.set("n", "<leader>tf", "<cmd>ToggleAutoformatting<CR>", { desc = "Toggle Autoformatting" })

			-- save without formatting
			vim.keymap.set("n", "<leader>W", function()
				vim.g.disable_autoformat = true
				vim.cmd("w")
				vim.g.disable_autoformat = false
			end, { desc = "Save Without Formatting" })
		end,
	},
}
