local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('sitiom/nvim-numbertoggle')
end)
