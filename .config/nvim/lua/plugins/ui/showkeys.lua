local showkeys = require('showkeys')
showkeys.setup({
  maxkeys = 5,
  position = 'top-right',
})
vim.keymap.set('n', '<leader>tk', showkeys.toggle, { desc = 'Toggle Showkeys' })
