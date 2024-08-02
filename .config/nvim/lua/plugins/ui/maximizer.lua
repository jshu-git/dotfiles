return {
  enabled = false,
  '0x00-ketsu/maximizer.nvim',
  keys = { '<leader>tm' },
  config = function()
    local maximizer = require('maximizer')
    maximizer.setup()
    vim.keymap.set(
      'n',
      '<C-w>m',
      maximizer.toggle,
      { desc = 'Toggle: Maximize Window' }
    )
  end,
}
