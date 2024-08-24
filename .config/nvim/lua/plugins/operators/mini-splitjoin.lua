local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  require('mini.splitjoin').setup({
    mappings = {
      toggle = 'sj',
    },
  })
end)
