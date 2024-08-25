local notify = require('mini.notify')
notify.setup({
  content = {
    sort = function(notif_arr)
      table.sort(notif_arr, function(a, b)
        return a.ts_update < b.ts_update
      end)
      return notif_arr
    end,
  },
  window = {
    max_width_share = 0.5,
    config = {
      border = 'none',
      anchor = 'SE',
      row = vim.o.lines - vim.o.cmdheight - (vim.o.laststatus > 0 and 1 or 0),
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
