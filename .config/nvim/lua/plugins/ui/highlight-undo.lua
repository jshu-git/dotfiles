require('highlight-undo').setup({
  duration = require('utils').highlight_timeout,
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
})
