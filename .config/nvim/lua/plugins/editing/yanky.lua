local actions = require('yanky.picker').actions
require('yanky').setup({
  picker = {
    select = {
      action = actions.set_register('+'),
    },
  },
  highlight = {
    timer = require('utils').highlight_timeout,
  },
})
vim.keymap.set({ 'n', 'x' }, 'y', '<Plug>(YankyYank)')
vim.keymap.set('n', 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set('n', 'P', '<Plug>(YankyPutIndentAfterLinewise)')
vim.keymap.set('n', '<leader>y', '<cmd>YankyRingHistory<CR>', { desc = 'Yank History' })
