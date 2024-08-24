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
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'lazy',
    'noice',
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
require('config.utils').apply_highlights({
  MiniIndentScopeSymbol = { link = 'NonText' },
})
