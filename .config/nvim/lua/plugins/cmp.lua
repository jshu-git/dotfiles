return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"dmitmel/cmp-cmdline-history",
			"hrsh7th/cmp-calc",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					-- { name = "lazydev" },
					{ name = "calc" },
					{ name = "buffer" },
					{ name = "path" },
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				window = {
					completion = {
						border = "single",
						side_padding = 0,
						scrollbar = false,
					},
					documentation = {
						border = "single",
					},
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = function()
							return math.floor(0.33 * vim.o.columns)
						end,
						ellipsis_char = "…",
						show_labelDetails = true,
					}),
				},
				completion = {
					keyword_length = 1,
					completeopt = "menu,menuone,preview,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-x>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					-- snippets
					["<C-l>"] = cmp.mapping(function(fallback)
						if vim.snippet.active({ direction = 1 }) then
							vim.snippet.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function(fallback)
						if vim.snippet.active({ direction = -1 }) then
							vim.snippet.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			})

			-- / cmdline setup
			cmp.setup.cmdline({ "/", "?" }, {
				completion = {
					keyword_length = 1,
					completeopt = "menu,menuone,preview,noinsert,noselect",
				},
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- : cmdline setup
			cmp.setup.cmdline(":", {
				completion = {
					keyword_length = 1,
					completeopt = "menu,menuone,preview,noinsert,noselect",
				},
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "cmdline_history" },
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
				},
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = false,
						next = "<C-space>",
					},
				},
				filetypes = {
					["."] = true,
					["*"] = true,
				},
			})

			-- https://github.com/zbirenbaum/copilot.lua/issues/91
			vim.keymap.set("i", "<Tab>", function()
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end)
		end,
	},

	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup()
		end,
	},
}
