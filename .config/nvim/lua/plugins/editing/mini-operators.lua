local operators = require('mini.operators')
operators.setup({
  evaluate = { prefix = 'se' },
  exchange = { prefix = '' },
  multiply = { prefix = 'sm' },
  replace = { prefix = '' }, -- using substitute.nvim for highlight
  sort = { prefix = 'so' },
})

operators.make_mappings('replace', {
  textobject = 's',
  line = 'ss',
  selection = 'ss',
})
vim.keymap.set('n', 'S', 's$', { remap = true })
vim.keymap.set('n', 'sE', 'se$', { remap = true, desc = 'Evaluate (EOL)' })
