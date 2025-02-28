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
      row = vim.o.lines - 2,
    },
    winblend = 0,
  },
})
vim.notify = notify.make_notify()

vim.keymap.set('n', '<leader>nn', function()
  vim.cmd('tabnew')
  notify.show_history()
  vim.cmd('norm! G')
  vim.wo.wrap = true
end, { desc = 'Notifications History' })
vim.keymap.set('n', '<leader>nx', notify.clear, { desc = 'Clear Notifications' })
