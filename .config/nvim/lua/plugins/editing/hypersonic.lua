require('hypersonic').setup({ border = 'single', enable_cmdline = false })
vim.keymap.set('n', 'gR', '<cmd>Hypersonic<CR>', { desc = 'Regex Help' })
vim.keymap.set('x', 'gR', ":'<,'>Hypersonic<CR>", { desc = 'Regex Help' })
