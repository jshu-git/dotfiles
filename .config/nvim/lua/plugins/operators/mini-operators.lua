return {
  'echasnovski/mini.operators',
  config = function()
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
  end,
}
