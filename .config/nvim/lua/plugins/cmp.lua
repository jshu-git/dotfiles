return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
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
					completion = {
						border = "single",
						side_padding = 0,
						scrollbar = false,
					},
					documentation = {
						border = "single",
						max_width = 25,
					},
				},
				-- https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-5727678
				formatting = {
					fields = { "abbr", "kind" },
					format = function(entry, item)
						item.menu = ""
						local fixed_width = 25
						local content = item.abbr
						if fixed_width then
							vim.o.pumwidth = fixed_width
						end
						local win_width = vim.api.nvim_win_get_width(0)
						local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)
						if #content > max_content_width then
							item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 1) .. "…"
						else
							item.abbr = content .. (" "):rep(max_content_width - #content)
						end
						return item
					end,
				},
				completion = {
					keyword_length = 2,
					completeopt = "menu,menuone,preview,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-x>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(),
					["/"] = cmp.mapping.abort(),
					-- https://github.com/hrsh7th/nvim-cmp/discussions/924
					["<esc>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.abort()
						else
							fallback()
						end
					end, { "i", "c" }),
				}),
			})

			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
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
}
