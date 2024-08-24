local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('0xAdk/full_visual_line.nvim')
  require('full_visual_line').setup({})
end)
