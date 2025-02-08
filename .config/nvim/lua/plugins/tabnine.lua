require('tabnine').setup({
  disable_auto_comment = false,
  accept_keymap = false,
  dismiss_keymap = false,
  debounce_ms = 0,
  -- suggestion_color = { gui = '#616E88', cterm = 'bold' },
  codelens_enabled = false,
  exclude_filetypes = { 'snacks_picker_input' },
  -- tabnine_enterprise_host = ""
})

local keymaps = require('tabnine.keymaps')
vim.keymap.set('i', '<Tab>', function()
  if keymaps.has_suggestion() then
    keymaps.accept_suggestion()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
  end
end)
vim.keymap.set('i', '<C-c>', function()
  if keymaps.has_suggestion() then
    keymaps.dismiss_suggestion()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, false, true), 'n', false)
  end
end)
