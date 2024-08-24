local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('chrisgrieser/nvim-early-retirement')
  require('early-retirement').setup({})
end)
