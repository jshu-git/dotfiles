local persisted = require('persisted')
persisted.setup({ autoload = true })

vim.keymap.set('n', '<leader>Sx', function()
  persisted.delete()
  vim.notify('Deleted Current Session')
end, { desc = 'Delete Current Session' })
vim.keymap.set('n', '<leader>Ss', function()
  persisted.start()
  vim.notify('Started Recording Session')
end, { desc = 'Start Recording Session' })
vim.keymap.set('n', '<leader>SS', function()
  persisted.stop()
  vim.notify('Stopped Recording Session')
end, { desc = 'Stop Recording Session' })

-- picker
vim.keymap.set('n', '<leader>fs', persisted.select, { desc = 'Sessions' })
