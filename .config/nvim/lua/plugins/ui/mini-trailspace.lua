local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  local trailspace = require('mini.trailspace')
  trailspace.setup()

  vim.keymap.set(
    'n',
    '<leader>T',
    trailspace.trim,
    { desc = 'Trim Trailspace' }
  )
end)
