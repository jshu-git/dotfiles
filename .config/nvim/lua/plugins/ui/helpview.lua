local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add({
    source = 'OXY2DEV/helpview.nvim',
    depends = { 'nvim-treesitter/nvim-treesitter' },
  })

  vim.keymap.set(
    'n',
    '<leader>tH',
    '<cmd>Helpview toggleAll<CR>',
    { desc = 'Toggle Helpview' }
  )
end)
