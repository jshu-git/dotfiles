local notify = require('mini.notify')
notify.setup({
  window = {
    max_width_share = 0.5,
    config = {
      border = 'single',
      anchor = 'SE',
      row = vim.o.lines - 2,
    },
    winblend = 0,
  },
})
vim.notify = notify.make_notify()

vim.keymap.set('n', '<leader>nn', notify.show_history, { desc = 'Notifications History' })
vim.keymap.set('n', '<leader>nx', notify.clear, { desc = 'Clear Notifications' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'mininotify-history' },
  callback = function(event)
    vim.keymap.set('n', '<esc>', '<cmd>bd<cr>', { buffer = event.buf, silent = true })
  end,
})
