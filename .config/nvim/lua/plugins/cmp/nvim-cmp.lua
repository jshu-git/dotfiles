local cmp = require('cmp')
cmp.setup({
  performance = {
    debounce = 0,
    throttle = 0,
  },
  sources = {
    { name = 'nvim_lsp', max_item_count = 5 },
    { name = 'buffer', max_item_count = 3 },
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
      -- border = 'single',
      -- side_padding = 0,
      scrolloff = 3,
      -- col_offset = 0,
      winhighlight = 'Normal:Pmenu,CursorLine:Visual',
      -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      -- winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
      -- winhighlight = 'Normal:Pmenu,Cursorline:Visual',
    },
    documentation = {
      border = 'single',
      -- side_padding = 0,
      winhighlight = 'FloatBorder:FloatBorder',
      -- max_width = math.floor(vim.o.columns * 0.3),
      -- winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu',
      -- winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      -- mode = "symbol",
      maxwidth = function()
        return math.floor(vim.o.columns * 0.3)
      end,
      ellipsis_char = '…',
      -- menu = {
      --   nvim_lsp = 'LSP',
      --   buffer = 'BUF',
      --   async_path = 'PTH',
      --   cmdline = 'CMD',
      --   cmdline_history = 'HST',
      -- },
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
    completeopt = 'menu,menuone,noselect',
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- : cmdline setup
cmp.setup.cmdline(':', {
  completion = {
    completeopt = 'menu,menuone,noselect',
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline_history', max_item_count = 2 },
    { name = 'cmdline', max_item_count = 5 },
    { name = 'async_path', max_item_count = 2 },
  }),
})

-- autopairs
require('nvim-autopairs').setup()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
