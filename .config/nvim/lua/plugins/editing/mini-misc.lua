local misc = require('mini.misc')
misc.setup_restore_cursor()
vim.keymap.set('n', '<C-w>m', misc.zoom, { desc = 'Toggle Maximize' })
