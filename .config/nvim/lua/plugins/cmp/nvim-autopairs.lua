local autopairs = require('nvim-autopairs')
autopairs.setup()

-- https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
_G.MUtils = {}
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return autopairs.esc('<c-y>')
    else
      return autopairs.esc('<c-e>') .. autopairs.autopairs_cr()
    end
  else
    return autopairs.autopairs_cr()
  end
end
vim.api.nvim_set_keymap('i', '<cr>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
