local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

now(function()
  add('sitiom/nvim-numbertoggle')
end)
