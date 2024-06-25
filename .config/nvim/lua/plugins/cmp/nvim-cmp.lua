return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- "hrsh7th/cmp-nvim-lsp-signature-help",
		-- "hrsh7th/cmp-path",
		"FelipeLema/cmp-async-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		"dmitmel/cmp-cmdline-history",
		-- ui
		"onsails/lspkind-nvim",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "lazydev", group_index = 0 },
				{ name = "nvim_lsp", max_item_count = 5 },
				-- { name = "nvim_lsp_signature_help" },
				{ name = "buffer", max_item_count = 3 },
				{ name = "calc" },
				{ name = "async_path" },
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			view = {
				docs = {
					auto_open = false,
				},
			},
			window = {
				completion = {
					border = "single",
					side_padding = 0,
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				},
				documentation = {
					border = "single",
					winhighlight = "FloatBorder:FloatBorder",
				},
			},
			-- https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-5727678
			-- https://github.com/Roundlay/nvim/blob/main/lua/plugins/lazy-cmp.lua
			-- formatting = {
			-- 	fields = { "abbr", "menu", "kind" },
			-- 	format = function(entry, item)
			-- 		local menu_icon = {
			-- 			nvim_lsp = "LSP",
			-- 			buffer = "BUF",
			-- 			async_path = "PTH",
			-- 			cmdline = "CMD",
			-- 			cmdline_history = "HST",
			-- 			calc = "CLC",
			-- 		}
			-- 		item.menu = menu_icon[entry.source.name]
			-- 		local content = item.abbr
			-- 		local win_width = vim.api.nvim_win_get_width(0)
			-- 		local max_content_width = math.floor(win_width * 0.15)
			-- 		if #content > max_content_width then
			-- 			item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 1) .. "…"
			-- 		else
			-- 			item.abbr = content .. (" "):rep(max_content_width - #content)
			-- 		end
			-- 		return item
			-- 	end,
			-- },
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					-- mode = "symbol",
					maxwidth = function()
						return math.floor(vim.o.columns * 0.15)
					end,
					ellipsis_char = "…",
					show_labelDetails = true,
					menu = {
						lazydev = "LZY",
						nvim_lsp = "LSP",
						buffer = "BUF",
						async_path = "PTH",
						cmdline = "CMD",
						cmdline_history = "HST",
						calc = "CLC",
					},
				}),
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-x>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- snippets
				["<C-l>"] = cmp.mapping(function(fallback)
					if vim.snippet.active({ direction = 1 }) then
						vim.snippet.jump(1)
					else
						fallback()
					end
				end),
				["<C-h>"] = cmp.mapping(function(fallback)
					if vim.snippet.active({ direction = -1 }) then
						vim.snippet.jump(-1)
					else
						fallback()
					end
				end),
				["<C-g>"] = function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end,
			}),
		})

		-- / cmdline setup
		cmp.setup.cmdline({ "/", "?" }, {
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			mapping = cmp.mapping.preset.cmdline({
				["<C-x>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end, { "c" }),
			}),
			sources = {
				{ name = "buffer" },
			},
		})

		-- : cmdline setup
		cmp.setup.cmdline(":", {
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			mapping = cmp.mapping.preset.cmdline({
				["<C-x>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end, { "c" }),
			}),
			sources = cmp.config.sources({
				{ name = "cmdline_history", max_item_count = 3 },
				{ name = "cmdline", max_item_count = 5 },
				{ name = "async_path" },
			}),
		})
	end,
}
