require('blink.cmp').setup({
  enabled = function()
    return not vim.tbl_contains({ 'grug-far' }, vim.bo.filetype)
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
      selection = function(ctx)
        return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect'
      end,
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
      window = { border = 'single' },
    },
  },
  fuzzy = {
    -- work
    prebuilt_binaries = {
      download = vim.env.SSH_CLIENT == nil,
    },
  },
  sources = {
    cmdline = function()
      local type = vim.fn.getcmdtype()
      if type == '/' or type == '?' then
        return { 'buffer' }
      end
      if type == ':' then
        return { 'cmdline' }
      end
      return {}
    end,
  },
})
