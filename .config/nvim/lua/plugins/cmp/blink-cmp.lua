require('blink.cmp').setup({
  enabled = function()
    return not vim.tbl_contains({}, vim.bo.filetype) and vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false
  end,
  keymap = {
    preset = 'enter',
    ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
    ['<C-k>'] = {},
  },
  cmdline = {
    keymap = {
      ['<CR>'] = { 'accept_and_enter', 'fallback' },
      ['<C-e>'] = { 'cancel', 'fallback' },
      ['<Right>'] = {},
      ['<Left>'] = {},
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
    implementation = 'rust',
    -- work
    prebuilt_binaries = {
      download = vim.env.SSH_CLIENT == nil,
      ignore_version_mismatch = true,
    },
  },
})
