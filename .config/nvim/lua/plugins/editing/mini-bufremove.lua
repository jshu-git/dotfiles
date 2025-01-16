local bufremove = require('mini.bufremove')
bufremove.setup()
vim.keymap.set('n', '<leader>D', bufremove.delete, { desc = 'Buffer: Delete (Smart)' })
