local quicker = require('quicker')
quicker.setup({
  opts = { number = true },
  keys = {
    {
      '>',
      function()
        quicker.expand({
          before = 1,
          after = 1,
          add_to_existing = true,
        })
      end,
    },
    { '<', quicker.collapse },
  },
  type_icons = {
    E = require('utils').signs.Error,
    W = require('utils').signs.Warn,
    I = require('utils').signs.Info,
    N = require('utils').signs.Hint,
    H = require('utils').signs.Hint,
  },
})

vim.keymap.set('n', '<down>', '<cmd>cnext<cr>')
vim.keymap.set('n', '<up>', '<cmd>cprev<cr>')

vim.keymap.set('n', '<leader>c', function()
  quicker.toggle({ focus = true })
end, { desc = 'Quickfix List' })
-- vim.keymap.set('n', '<leader>C', function()
--   quicker.refresh()
--   vim.notify('[quicker.nvim] Refreshed Quickfix List')
-- end, { desc = 'Quickfix (Refresh)' })
