local augend = require('dial.augend')
require('dial.config').augends:register_group({
  default = {
    augend.integer.alias.decimal,
    augend.constant.alias.bool,
    augend.constant.new({
      elements = { 'and', 'or' },
      word = true,
      cyclic = true,
    }),
    augend.constant.new({
      elements = { '&&', '||' },
      word = false,
      cyclic = true,
    }),
  },
})
vim.keymap.set('n', '=', require('dial.map').inc_normal())
vim.keymap.set('n', '-', require('dial.map').dec_normal())
