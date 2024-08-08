return {
  'domharries/foldnav.nvim',
  config = function()
    local foldnav = require('foldnav')

    vim.keymap.set({ 'n', 'x', 'o' }, 'zh', function()
      foldnav.goto_start()
    end)
    vim.keymap.set('n', 'zj', function()
      foldnav.goto_next()
    end)
    vim.keymap.set('n', 'zk', function()
      foldnav.goto_prev_start()
    end)
    vim.keymap.set('n', 'zl', function()
      foldnav.goto_end()
    end)
  end,
}
