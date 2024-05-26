return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			window = {
				completion = { border = "single" },
				documentation = { border = "single" },
			},
			completion = {
				keyword_length = 2,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-x>"] = cmp.mapping.complete({}),
				["<C-c>"] = cmp.mapping.abort(),
			}),
		})
	end,
}
