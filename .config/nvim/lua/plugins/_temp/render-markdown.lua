require('render-markdown').setup()
vim.keymap.set('n', '<leader>tv', '<cmd>RenderMarkdown toggle<cr>', { desc = 'Toggle Markdown' })
