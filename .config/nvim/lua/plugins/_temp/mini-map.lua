local map = require('mini.map')
map.setup({
  symbols = {
    scroll_line = '',
    scroll_view = '█',
  },
  window = {
    width = 1,
    winblend = 100,
    show_integration_count = false,
  },
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    map.open()
  end,
})

vim.keymap.set('n', '<leader>tm', map.toggle, { desc = 'Toggle mini.map' })
