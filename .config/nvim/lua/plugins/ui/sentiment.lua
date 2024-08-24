local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('utilyre/sentiment.nvim')

  vim.g.loaded_matchparen = 1
  require('sentiment').setup({
    delay = 0,
    pairs = {
      { '(', ')' },
      { '{', '}' },
      { '[', ']' },
      { '<', '>' },
    },
  })
end)
