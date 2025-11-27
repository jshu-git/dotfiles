local chat = require('CopilotChat')
chat.setup({
  model = 'claude-sonnet-4.5',
  window = {
    layout = 'vertical',
    width = 0.5,
  },
  show_help = false,
  -- chat_autocomplete = false,
  -- separator = '',
  mappings = {
    -- complete = {
    --   insert = '',
    -- },
    close = {
      normal = '<leader>q',
      insert = '',
    },
    reset = {
      normal = '<leader>r',
      insert = '',
    },
    submit_prompt = {
      normal = '<leader>w',
      insert = '',
    },
  },
})

vim.keymap.set({ 'n', 'x' }, '<leader>a', chat.toggle, { desc = 'CopilotChat' })
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    -- vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
  end,
})
