return {
  'echasnovski/mini.operators',
  keys = {
    { 'se', mode = { 'n', 'x' } },
    { 'sx', mode = { 'n', 'x' } },
    { 'sm', mode = { 'n', 'x' } },
    { 'so', mode = { 'n', 'x' } },
  },
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
