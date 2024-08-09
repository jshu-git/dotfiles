return {
  'echasnovski/mini.surround',
  keys = {
    'sd',
    'sr',
    { 'S', mode = { 'x' } },
  },
  config = function()
    local surround = require('mini.surround')
    surround.setup({
      -- reverse left and right behavior
      custom_surroundings = {
        ['('] = { output = { left = '(', right = ')' } },
        [')'] = { output = { left = '( ', right = ' )' } },
        ['{'] = { output = { left = '{', right = '}' } },
        ['}'] = { output = { left = '{ ', right = ' }' } },
        ['['] = { output = { left = '[', right = ']' } },
        [']'] = { output = { left = '[ ', right = ' ]' } },
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
  end,
}
