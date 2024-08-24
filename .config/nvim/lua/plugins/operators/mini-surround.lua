local surround = require('mini.surround')
surround.setup({
  mappings = {
    add = 'sS',
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
