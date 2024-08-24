local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('luukvbaal/statuscol.nvim')

  require('statuscol').setup({ relculright = true })
end)
