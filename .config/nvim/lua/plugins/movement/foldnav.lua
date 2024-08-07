return {
  'domharries/foldnav.nvim',
  config = function()
    local foldnav = require('foldnav')

    vim.keymap.set('n', '<C-h>', function()
      foldnav.goto_start()
    end)
    vim.keymap.set('n', '<C-j>', function()
      foldnav.goto_next()
    end)
    vim.keymap.set('n', '<C-k>', function()
      foldnav.goto_prev_start()
    end)
    vim.keymap.set('n', '<C-l>', function()
      foldnav.goto_end()
    end)
  end,
}
