local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('tzachar/highlight-undo.nvim')

  require('highlight-undo').setup({
    duration = require('config.utils').highlight_timeout,
    undo = {
      hlgroup = 'Search',
      mode = 'n',
      lhs = 'u',
      map = 'undo',
      opts = {},
    },
    redo = {
      hlgroup = 'Search',
      mode = 'n',
      lhs = 'U',
      map = 'redo',
      opts = {},
    },
    highlight_for_count = true,
  })
end)
