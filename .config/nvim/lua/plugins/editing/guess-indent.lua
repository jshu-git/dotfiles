local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

now(function()
  add('nmac427/guess-indent.nvim')
  require('guess-indent').setup({})
end)
