local diff = require('mini.diff')
diff.setup({
  view = {
    style = 'sign',
    signs = {
      add = '+',
      change = '~',
      delete = '-',
    },
  },
})

vim.keymap.set('n', '<leader>gd', diff.toggle_overlay, { desc = 'Toggle Diff' })

-- stage hunk
-- vim.keymap.set('n', '<leader>ga', 'ghgh', { desc = 'Stage Hunk', remap = true })
-- vim.keymap.set('x', '<leader>ga', 'gh', { desc = 'Stage Hunk (Visual)', remap = true })

-- reset hunks
vim.keymap.set('n', '<leader>gr', 'gHgh', { desc = 'Reset Hunk', remap = true })
vim.keymap.set('x', '<leader>gr', 'gH', { desc = 'Reset Hunk (Visual)', remap = true })
vim.keymap.set('n', '<leader>gR', function()
  diff.do_hunks(0, 'reset')
end, { desc = 'Reset Hunk (Buffer)' })

-- hunks to quickfix
-- vim.keymap.set('n', '<leader>gq', function()
--   vim.fn.setqflist(diff.export('qf'))
--   vim.cmd('copen')
-- end, { desc = 'Hunks (Quickfix)' })
