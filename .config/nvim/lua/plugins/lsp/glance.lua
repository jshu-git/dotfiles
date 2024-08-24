local glance = require('glance')
local actions = glance.actions

glance.setup({
  height = require('config.utils').popup.height,
  border = { enable = true, top_char = '', bottom_char = '▔' },
  list = { width = 0.2 },
  theme = { enable = false },
  mappings = {
    list = {
      ['<C-v>'] = actions.jump_vsplit,
      ['<C-s>'] = actions.jump_split,
      ['<C-CR>'] = actions.enter_win('preview'),
      ['<esc>'] = actions.close,
    },
    preview = {
      ['<esc>'] = actions.enter_win('list'),
    },
  },
  folds = { folded = false },
})
