return {
  'gbprod/yanky.nvim',
  keys = {
    '<leader>y',
    'p',
    'P',
    { 'y', mode = { 'n', 'x' } },
  },
  config = function()
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
  end,
}
