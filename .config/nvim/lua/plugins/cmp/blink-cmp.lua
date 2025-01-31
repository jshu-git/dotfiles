require('blink.cmp').setup({
  enabled = function()
    return not vim.tbl_contains({ 'rip-substitute' }, vim.bo.filetype)
      and vim.bo.buftype ~= 'prompt'
      and vim.b.completion ~= false
  end,
  keymap = {
    preset = 'enter',
    ['<C-z>'] = { 'show_documentation', 'hide_documentation', 'fallback' },
    ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
  },
  completion = {
    list = {
      selection = {
        preselect = function(ctx)
          return ctx.mode ~= 'cmdline'
        end,
        -- auto_insert = function(ctx)
        --   return ctx.mode ~= 'cmdline'
        -- end,
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
    documentation = { window = { border = 'single' } },
  },
  signature = { window = { border = 'single' } },
  fuzzy = {
    -- work
    prebuilt_binaries = {
      download = vim.env.SSH_CLIENT == nil,
    },
  },
})
