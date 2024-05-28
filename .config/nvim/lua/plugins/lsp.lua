return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			-- ui
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = { window = { winblend = 0, align = "top" } },
				},
			},
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
					map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
					-- map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
					-- map("gt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")

					map("gd", vim.lsp.buf.definition, "Goto Definition")
					-- map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
					map("gs", vim.lsp.buf.hover, "Hover Documentation")
					map("gS", vim.lsp.buf.signature_help, "Hover Signature")
					map("gr", require("telescope.builtin").lsp_references, "Goto References")
					map("gR", vim.lsp.buf.rename, "Rename Variable")

					map("]d", vim.diagnostic.goto_prev, "Next Diagnostic")
					map("[d", vim.diagnostic.goto_next, "Previous Diagnostic")

					-- clear highlights when moving cursor
					-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L510
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

						-- toggle inlay hints
						if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
							map("<leader>th", function()
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
							end, "Toggle Inlay Hints")
						end
					end
				end,
			})

			-- servers https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
			local servers = {
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
				taplo = {},
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

			require("mason").setup({
				ui = {
					border = "single",
					height = 0.8,
				},
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
				float = { border = "single" },
				virtual_text = false,
			})
			local signs = { Error = "", Warn = "", Hint = "", Info = "" }
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
				icons = { error = "", warn = "", hint = "", info = "" },
			})
		end,
	},

	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		local lint = require("lint")

	-- 		lint.linters_by_ft = {
	-- 			zsh = { "zsh" },
	-- 		}

	-- 		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
	-- 		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	-- 			group = lint_augroup,
	-- 			callback = function()
	-- 				lint.try_lint()
	-- 			end,
	-- 		})
	-- 		vim.keymap.set("n", "<leader>L", function()
	-- 			lint.try_lint()
	-- 		end, { desc = "Lint File" })
	-- 	end,
	-- },

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },

					json = { "prettier" },
					markdown = { "prettier" },
					sh = { "shfmt" },
					zsh = { "shfmt" },

					["*"] = { "codespell", "trim_whitespace" },
					-- ["_"] = { "trim_whitespace" },
				},
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat then
						return
					end
					return {
						lsp_fallback = true,
						async = false,
						quiet = false,
						timeout_ms = 500,
					}
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
		end,
	},
}
