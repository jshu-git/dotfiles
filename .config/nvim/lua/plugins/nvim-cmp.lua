return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	build = "make install_jsregexp",
		-- },
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		-- local luasnip = require("luasnip")
		-- luasnip.config.setup()

		cmp.setup({
			snippet = {
				expand = function(args)
					-- luasnip.lsp_expand(args.body)
					vim.snippet.expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			completion = {
				-- autocomplete = false,
				-- completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-x>"] = cmp.mapping.complete({}),
				["<Esc>"] = cmp.mapping.abort(),
				-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			}),
			sources = {
				{ name = "nvim_lsp" },
				-- { name = 'luasnip' },
				{ name = "path" },
			},
		})
	end,
}
