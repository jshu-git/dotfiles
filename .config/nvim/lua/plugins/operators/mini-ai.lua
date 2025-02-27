local ai = require('mini.ai')
local extra_ai = require('mini.extra').gen_ai_spec
ai.setup({
  n_lines = 500,
  mappings = {
    around_next = '',
    inside_next = '',
    around_last = '',
    inside_last = '',
    goto_left = '',
    goto_right = '',
  },
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
