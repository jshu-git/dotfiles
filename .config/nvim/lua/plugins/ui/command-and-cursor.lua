local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('moyiz/command-and-cursor.nvim')

  require('command_and_cursor').setup({
    hl_group = 'Visual',
    inclusive = false,
  })
end)
