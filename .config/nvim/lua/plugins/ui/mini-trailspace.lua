local trailspace = require('mini.trailspace')
trailspace.setup()
vim.keymap.set('n', '<leader>tt', trailspace.trim, { desc = 'Trim Trailspace' })
