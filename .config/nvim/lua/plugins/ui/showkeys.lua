local showkeys = require('showkeys')
showkeys.setup({
  winopts = { row = 0 },
  maxkeys = 5,
  position = 'top-right',
})
vim.keymap.set('n', '<leader>tk', showkeys.toggle, { desc = 'Toggle Showkeys' })
