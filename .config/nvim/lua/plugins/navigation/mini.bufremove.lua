return {
  'echasnovski/mini.bufremove',
  keys = {
    '<leader>D',
  },
  config = function()
    local bufremove = require('mini.bufremove')
    require('mini.bufremove').setup()

    vim.keymap.set(
      'n',
      '<leader>D',
      bufremove.delete,
      { desc = 'Buffer: Delete (Smart)' }
    )
  end,
}
