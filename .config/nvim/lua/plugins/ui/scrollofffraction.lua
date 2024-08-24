local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('nkakouros-original/scrollofffraction.nvim')

  require('scrollofffraction').setup({
    scrolloff_fraction = 0.3,
  })
end)
