local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('NStefan002/visual-surround.nvim')

  require('visual-surround').setup({
    surround_chars = { '{', '[', '(', "'", '"', '`', '<' },
  })
end)
