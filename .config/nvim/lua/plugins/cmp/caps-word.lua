local caps = require('caps-word')
caps.setup({
  enter_callback = function()
    vim.notify('Toggled caps-word: On', vim.log.levels.INFO)
  end,
  exit_callback = function()
    vim.notify('Toggled caps-word: Off', vim.log.levels.INFO)
  end,
})

vim.keymap.set('i', '<C-s>', caps.toggle)
