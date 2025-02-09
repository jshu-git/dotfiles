local oil = require('oil')

oil.setup({
  columns = { 'icon' },
  win_options = {
    number = false,
  },
  delete_to_trash = true,
  watch_for_changes = true,

  -- keymaps
  use_default_keymaps = false,
  keymaps = {
    ['<CR>'] = 'actions.select',
    ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
    ['<Tab>'] = { 'actions.preview', mode = 'n' },
    ['<Esc>'] = { 'actions.close', mode = 'n' },

    ['-'] = { 'actions.parent', mode = 'n' },
    ['_'] = { 'actions.open_cwd', mode = 'n' },
    -- ['`'] = { 'actions.cd', mode = 'n' },
    -- ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },

    ['g?'] = { 'actions.show_help', mode = 'n' },
    ['gr'] = { 'actions.refresh', mode = 'n' },
    ['gs'] = { 'actions.change_sort', mode = 'n' },
    ['gh'] = { 'actions.toggle_hidden', mode = 'n' },
    ['gt'] = { 'actions.toggle_trash', mode = 'n' },
  },

  view_options = {
    show_hidden = vim.env.SSH == nil,
  },
  float = {
    max_width = 0.8,
    max_height = 0.8,
    border = 'single',
    preview_split = 'right',
  },
  confirmation = { border = 'single' },
  progress = { border = 'single' },
})

vim.keymap.set('n', '<leader>e', oil.open_float, { desc = 'Oil' })
