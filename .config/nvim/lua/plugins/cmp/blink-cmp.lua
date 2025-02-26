require('blink.cmp').setup({
  enabled = function()
    return not vim.tbl_contains({}, vim.bo.filetype) and vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false
  end,
  keymap = {
    preset = 'enter',
    -- ['<C-S-u>'] = { 'scroll_documentation_up', 'fallback' },
    -- ['<C-S-d>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

    ['<Tab>'] = {},
    ['<S-Tab>'] = {},
    ['<C-k>'] = {},
  },
  cmdline = {
    keymap = {
      ['<CR>'] = { 'accept_and_enter', 'fallback' },
    },
    completion = {
      menu = { auto_show = true },
    },
  },
  completion = {
    list = {
      selection = {
        preselect = function(ctx)
          return ctx.mode ~= 'cmdline'
        end,
        auto_insert = function(ctx)
          return ctx.mode ~= 'cmdline'
        end,
      },
    },
    accept = {
      auto_brackets = { enabled = false },
    },
    menu = {
      max_height = 5,
      scrolloff = 3,
      draw = {
        columns = {
          { 'label', 'label_description', gap = 1 },
          { 'kind_icon', 'kind', gap = 1 },
        },
      },
    },
    documentation = {
      auto_show_delay_ms = 0,
      window = { border = 'single' },
    },
  },
  signature = {
    enabled = true,
    trigger = { enabled = false },
    window = {
      border = 'single',
      show_documentation = false,
    },
  },
  fuzzy = {
    -- work
    prebuilt_binaries = {
      download = vim.env.SSH_CLIENT == nil,
    },
  },
})
