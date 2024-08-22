return {
  'tzachar/highlight-undo.nvim',
  keys = { 'u', 'U' },
  config = function()
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
  end,
}
