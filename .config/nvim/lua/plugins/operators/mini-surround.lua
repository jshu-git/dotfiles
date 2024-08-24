local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
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

  -- vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]])
end)
