local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('kdheepak/lazygit.nvim')
  vim.g.lazygit_floating_window_scaling_factor = 1

  vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'LazyGit' })
  vim.keymap.set(
    'n',
    '<leader>gG',
    '<cmd>LazyGitConfig<CR>',
    { desc = 'LazyGit (Config)' }
  )
end)
