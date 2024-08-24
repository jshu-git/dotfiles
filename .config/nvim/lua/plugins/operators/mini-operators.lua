local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  local operators = require('mini.operators')
  operators.setup({
    evaluate = {
      prefix = 'se',
    },
    exchange = {
      prefix = 'sx',
    },
    multiply = {
      prefix = 'sm',
    },
    replace = {
      prefix = '', -- using substitute.nvim for highlight
    },
    sort = {
      prefix = 'so',
    },
  })
end)
