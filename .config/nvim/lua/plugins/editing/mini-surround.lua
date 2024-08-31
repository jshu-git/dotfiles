local surround = require('mini.surround')
surround.setup({
  custom_surroundings = {
    -- reverse defaults
    ['('] = { output = { left = '(', right = ')' } },
    ['['] = { output = { left = '[', right = ']' } },
    ['{'] = { output = { left = '{', right = '}' } },
    ['<'] = { output = { left = '<', right = '>' } },
    -- lua function
    f = { output = { left = 'function() ', right = ' end' } },
  },
  mappings = {
    add = '',
    delete = 'sd',
    replace = 'sr',
    update_n_lines = '',
    highlight = '',
    find = '',
    find_left = '',
    suffix_last = '',
    suffix_next = '',
  },
  n_lines = 200,
  respect_selection_type = true,
})

vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]])
