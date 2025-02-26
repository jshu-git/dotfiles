require('timber').setup({
  log_templates = {
    default = {
      lua = [[ print(vim.inspect(%log_target)) ]],
      python = [[ print(%log_target) ]],
      -- not supported yet
      perl = [[ print(%log_target) ]],
    },
  },
  highlight = { on_insert = false },
  default_keymaps_enabled = false,
})

local actions = require('timber.actions')
vim.keymap.set({ 'n', 'v' }, 'gl', function()
  actions.insert_log({ position = 'below' })
end, { desc = 'Log Below' })
