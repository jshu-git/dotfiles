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

vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Next Quickfix' })
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', { desc = 'Prev Quickfix' })

vim.keymap.set('n', '<leader>c', function()
  quicker.toggle({ focus = true })
end, { desc = 'Quickfix' })
-- vim.keymap.set('n', '<leader>C', function()
--   quicker.refresh()
--   vim.notify('[quicker.nvim] Refreshed Quickfix List')
-- end, { desc = 'Quickfix (Refresh)' })

-- override my <cr> map
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qf' },
  callback = function(event)
    vim.keymap.set('n', '<cr>', '<cr>', { buffer = event.buf, silent = true })
  end,
})
