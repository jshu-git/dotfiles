local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('briangwaltney/paren-hint.nvim')

  require('paren-hint').setup({
    highlight = 'NonText',
    excluded_filetypes = {},
    excluded_buftypes = {},
  })
end)
