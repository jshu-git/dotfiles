local completion = require('mini.completion')
completion.setup({
  delay = {
    completion = 0,
    info = 10 ^ 7,
    signature = 10 ^ 7,
  },
  window = {
    info = { border = 'single' },
    signature = { border = 'single' },
  },
  fallback_action = function() end,
  set_vim_settings = false,
})

-- autopairs
local autopairs = require('nvim-autopairs')
autopairs.setup({ map_cr = false })

-- https://github.com/echasnovski/mini.completion/blob/main/doc/mini-completion.txt#L129
-- https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
local keycode = vim.keycode or function(x)
  return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
  ['cr'] = keycode('<CR>'),
  ['ctrl-y'] = keycode('<C-y>'),
  ['ctrl-y_cr'] = keycode('<C-y><CR>'),
}
_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    -- If popup is not visible, use plain `<CR>`. You might want to customize
    -- according to other plugins. For example, to use 'mini.pairs', replace
    -- next line with `return require('mini.pairs').cr()`
    -- return keys['cr']
    return autopairs.autopairs_cr()
  end
end
vim.api.nvim_set_keymap('i', '<cr>', 'v:lua._G.cr_action()', { expr = true, noremap = true })
