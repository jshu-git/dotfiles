local autopairs = require('nvim-autopairs')
autopairs.setup({ map_cr = false })
-- TODO
-- return autopairs.autopairs_cr()

require('blink.cmp').setup({
  enabled = function()
    return not vim.tbl_contains({ 'grug-far' }, vim.bo.filetype)
      and vim.bo.buftype ~= 'prompt'
      and vim.b.completion ~= false
  end,
  keymap = {
    preset = 'enter',
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
