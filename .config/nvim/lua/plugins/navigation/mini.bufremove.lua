local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  local bufremove = require('mini.bufremove')
  bufremove.setup()

  vim.keymap.set(
    'n',
    '<leader>D',
    bufremove.delete,
    { desc = 'Buffer: Delete (Smart)' }
  )
end)
