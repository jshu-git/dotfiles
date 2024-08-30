local opt = vim.opt

opt.completeopt = 'menu,menuone,noinsert'
opt.shortmess:append('c')
if vim.fn.has('nvim-0.11') == 1 then
  opt.completeopt:append('fuzzy')
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

local autopairs = require('nvim-autopairs')
autopairs.setup()
-- https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
_G.MUtils = {}
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return autopairs.esc('<c-y>')
    else
      -- only relevant went completeopt has 'noselect'
      return autopairs.esc('<c-e>') .. autopairs.autopairs_cr()
    end
  else
    return autopairs.autopairs_cr()
  end
end
vim.api.nvim_set_keymap('i', '<cr>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
