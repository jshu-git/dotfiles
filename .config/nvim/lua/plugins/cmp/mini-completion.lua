if vim.fn.has('nvim-0.11') == 1 then
  vim.opt.completeopt:append('fuzzy')
end

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
    return keys['cr']
  end
end
vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })

-- local autopairs = require('nvim-autopairs')
-- autopairs.setup()
-- -- https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
-- _G.MUtils = {}
-- MUtils.completion_confirm = function()
--   if vim.fn.pumvisible() ~= 0 then
--     if vim.fn.complete_info()['selected'] ~= -1 then
--       return autopairs.esc('<c-y>')
--     else
--       -- only relevant went completeopt has 'noselect'
--       return autopairs.esc('<c-e>') .. autopairs.autopairs_cr()
--     end
--   else
--     return autopairs.autopairs_cr()
--   end
-- end
-- vim.api.nvim_set_keymap('i', '<cr>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
