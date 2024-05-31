return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- { "williamboman/mason.nvim", config = true },
			{ "folke/neodev.nvim", opts = {} },
			-- ui
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							winblend = 0,
							align = "top",
							border = "single",
						},
					},
				},
			},
			{
				"Fildo7525/pretty_hover",
				opts = {
					border = "single",
					max_width = 100,
					max_height = 15,
				},
			},
			-- cmp
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- https://old.reddit.com/r/neovim/comments/140b1p9/does_anyone_have_a_tip_or_keybind_to_open_and/
					local function open_definition_in_vertical_split()
						vim.lsp.buf.definition({
							on_list = function(options)
								-- if there are multiple items, warn
								if #options.items > 1 then
									vim.notify("Multiple definitions found, opening first one", vim.log.levels.WARN)
								end
								-- open the first item in a vertical split
								local item = options.items[1]
								local cmd = "vsplit +"
									.. item.lnum
									.. " "
									.. item.filename
									.. "|"
									.. "normal "
									.. item.col
									.. "|"
								vim.cmd(cmd)
							end,
						})
					end

					-- map("gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Goto Definition")
					map("gd", open_definition_in_vertical_split, "Goto Definition")
					-- map("gD", require("telescope.builtin").lsp_definitions, "Goto Definition")
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")
					-- map("gd", vim.lsp.buf.definition, "Goto Definition")

					-- lsp
					map("gs", require("pretty_hover").hover, "Hover Documentation")
					-- map("gs", vim.lsp.buf.hover, "Hover Documentation")
					map("gS", vim.lsp.buf.signature_help, "Hover Signature")
					map("gr", require("telescope.builtin").lsp_references, "Goto References")
					map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
					map("gt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")
					map("ga", vim.lsp.buf.code_action, "Code Action")
					map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
					map("gR", vim.lsp.buf.rename, "Rename Variable")

					map("]d", vim.diagnostic.goto_prev, "Next Diagnostic")
					map("[d", vim.diagnostic.goto_next, "Previous Diagnostic")

					-- lsp info
					map("<leader>li", "<cmd>LspInfo<CR>", "Info")
					-- map("<leader>ll", "<cmd>LspLog<CR>", "LSP Log")
					map("<leader>lr", "<cmd>LspRestart<CR>", "Restart")

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

			-- require("mason").setup({
			-- 	ui = {
			-- 		border = "single",
			-- 		height = 0.8,
			-- 	},
			-- })
			-- vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Mason" })

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
				-- jump = { float = true },
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
					["*"] = { "codespell", "trim_whitespace" },
				},
				-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_fallback = true }
				end,
				format_after_save = {
					lsp_fallback = true,
				},
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
