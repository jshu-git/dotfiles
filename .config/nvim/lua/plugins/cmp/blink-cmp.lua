require('blink.cmp').setup({
  enabled = function()
    return not vim.tbl_contains({ 'rip-substitute' }, vim.bo.filetype)
      and vim.bo.buftype ~= 'prompt'
      and vim.b.completion ~= false
  end,
  keymap = {
    preset = 'enter',
    ['<C-S-u>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-S-d>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

    -- cmdline = {
    --   ['<CR>'] = { 'select_and_enter', 'fallback' },
    -- },
  },
  completion = {
    list = {
      selection = {
        preselect = function(ctx)
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
      auto_show = false,
      auto_show_delay_ms = 0,
      window = {
        border = 'single',
        winhighlight = 'FloatBorder:FloatBorder',
      },
    },
  },
  signature = {
    enabled = true,
    trigger = {
      enabled = false,
      show_on_trigger_character = false,
      show_on_insert_on_trigger_character = false,
    },
    window = {
      border = 'single',
      winhighlight = 'FloatBorder:FloatBorder',
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
