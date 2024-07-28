return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-calc',
    'FelipeLema/cmp-async-path',
    -- cmdline
    'hrsh7th/cmp-cmdline',
    'dmitmel/cmp-cmdline-history',
    -- signature
    'hrsh7th/cmp-nvim-lsp-signature-help',
    -- ui
    'onsails/lspkind-nvim',
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = 'lazydev', group_index = 0 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp', max_item_count = 5 },
        { name = 'buffer', max_item_count = 3 },
        { name = 'calc', max_item_count = 2 },
        { name = 'async_path', max_item_count = 2 },
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
          -- border = "single",
          -- side_padding = 0,
          -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          winhighlight = 'Normal:Pmenu,Cursorline:Visual',
          -- col_offset = 2,
          -- scrollbar = false,
        },
        documentation = {
          -- border = "single",
          -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          -- max_width = math.floor(vim.o.columns * 0.3),
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu',
          -- scrollbar = false,
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
        format = require('lspkind').cmp_format({
          mode = 'symbol_text',
          -- mode = "symbol",
          maxwidth = function()
            return math.floor(vim.o.columns * 0.2)
          end,
          ellipsis_char = '…',
          menu = {
            nvim_lsp = 'LSP',
            buffer = 'BUF',
            async_path = 'PTH',
            cmdline = 'CMD',
            cmdline_history = 'HST',
            calc = 'CLC',
          },
        }),
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert({
        ['<S-CR>'] = cmp.config.disable,
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()
          else
            fallback()
          end
        end),
        -- snippets
        ['<C-l>'] = cmp.mapping(function(fallback)
          if vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end),
        ['<C-h>'] = cmp.mapping(function(fallback)
          if vim.snippet.active({ direction = -1 }) then
            vim.snippet.jump(-1)
          else
            fallback()
          end
        end),
        -- docs
        ['<C-g>'] = function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end,
      }),
    })

    -- / cmdline setup
    cmp.setup.cmdline({ '/', '?' }, {
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- : cmdline setup
    cmp.setup.cmdline(':', {
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'cmdline_history', max_item_count = 2 },
        { name = 'cmdline', max_item_count = 5 },
        { name = 'async_path', max_item_count = 2 },
      }),
    })
  end,
}
