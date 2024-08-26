require('icon-picker').setup({ disable_legacy_commands = true })
vim.keymap.set('n', '<leader>fi', '<cmd>IconPickerYank nerd_font_v3<cr>', { desc = 'Icons (Nerd Font)' })
vim.keymap.set('n', '<leader>fI', '<cmd>IconPickerYank symbols emoji<cr>', { desc = 'Icons (Symbols)' })
