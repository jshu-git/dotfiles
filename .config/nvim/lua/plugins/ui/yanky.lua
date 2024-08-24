local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('gbprod/yanky.nvim')

  local actions = require('yanky.picker').actions
  require('yanky').setup({
    picker = {
      select = {
        action = actions.set_register('+'),
      },
    },
    highlight = {
      timer = require('config.utils').highlight_timeout,
    },
  })

  vim.keymap.set({ 'n', 'x' }, 'y', '<Plug>(YankyYank)')
  vim.keymap.set('n', 'p', '<Plug>(YankyPutAfter)')
  vim.keymap.set('n', 'P', '<Plug>(YankyPutIndentAfterLinewise)')

  -- yank history
  vim.keymap.set(
    'n',
    '<leader>y',
    '<cmd>YankyRingHistory<CR>',
    { desc = 'Yank History' }
  )
end)
