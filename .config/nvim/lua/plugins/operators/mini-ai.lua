local ai = require('mini.ai')
local extra_ai = require('mini.extra').gen_ai_spec
ai.setup({
  n_lines = 500,
  custom_textobjects = {
    g = extra_ai.buffer(),
    l = extra_ai.line(),
    -- LazyVim
    e = { -- Word with case
      {
        '%u[%l%d]+%f[^%l%d]',
        '%f[%S][%l%d]+%f[^%l%d]',
        '%f[%P][%l%d]+%f[^%l%d]',
        '^[%l%d]+%f[^%l%d]',
      },
      '^().*()$',
    },
  },
})

vim.keymap.set('n', '<S-CR>', 'ciq', { remap = true })
-- vim.keymap.set('x', 'v', 'ilo', { remap = true })
vim.keymap.set('n', 'sl', 'sx' .. 'i' .. 'a' .. 'sx' .. 'in' .. 'a', { remap = true })
vim.keymap.set('n', 'sh', 'sx' .. 'i' .. 'a' .. 'sx' .. 'il' .. 'a', { remap = true })
