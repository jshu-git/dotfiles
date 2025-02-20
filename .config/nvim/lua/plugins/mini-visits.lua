local visits = require('mini.visits')
visits.setup({
  silent = true,
})

vim.keymap.set('n', '<Tab>', require('mini.extra').pickers.visit_paths, { desc = 'Visits (cwd)' })

vim.keymap.set('n', '<leader>v', function()
  visits.add_path()
  vim.notify('[mini.visits] Added path: ' .. vim.fn.expand('%:t'))
end, { desc = 'Visit' })
vim.keymap.set('n', '<leader>V', function()
  visits.remove_path()
  visits.write_index()
  vim.notify('[mini.visits] Removed path: ' .. vim.fn.expand('%:t'))
end, { desc = 'Remove Visit' })
