require('mini.indentscope').setup({
  draw = {
    animation = function()
      return 0
    end,
  },
  options = {
    indent_at_cursor = false,
    try_as_border = true,
  },
  symbol = '▏',
})
