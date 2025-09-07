require('blink.cmp').setup({
  keymap = {
    preset = 'enter',
  },
  cmdline = {
    keymap = {
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-e>'] = { 'cancel', 'fallback' },
      ['<Right>'] = {},
      ['<Left>'] = {},
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      menu = { auto_show = true },
    },
  },
  completion = {
    menu = {
      max_height = 5,
      border = 'none',
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
    },
  },
  signature = {
    enabled = false,
  },
  fuzzy = {
    implementation = 'rust',
    -- work
    prebuilt_binaries = {
      download = vim.env.SSH_CLIENT == nil,
      ignore_version_mismatch = true,
    },
  },
  sources = {
    providers = {
      path = {
        opts = {
          show_hidden_files_by_default = vim.env.SSH_CLIENT == nil,
        },
      },
    },
  },
})
