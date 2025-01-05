require('leetcode').setup({
  lang = 'python3',
  injector = {
    ['python3'] = {
      before = { 'from pprint import pprint' },
    },
  },
  console = {
    result = { size = '50%' },
    testcase = { size = '50%' },
  },
  description = { width = '50%' },
})

vim.keymap.set('n', '<leader>L', '<cmd>Leet<cr>')
vim.keymap.set('n', '<leader>fL', '<cmd>Leet list difficulty=easy<cr>')
