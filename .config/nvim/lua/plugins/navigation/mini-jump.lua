local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  require('mini.jump').setup({
    mappings = {
      repeat_jump = '', -- defaults to ;
    },
    delay = {
      highlight = 0,
    },
  })
end)
