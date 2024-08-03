return {
  'tomiis4/Hypersonic.nvim',
  keys = {
    { 'gR', mode = { 'n', 'x' } },
  },
  cmd = 'Hypersonic',
  config = function()
    require('hypersonic').setup({
      border = 'single',
      enable_cmdline = false,
    })
    vim.keymap.set('n', 'gR', '<cmd>Hypersonic<CR>', { desc = 'Regex Help' })
    vim.keymap.set('x', 'gR', ":'<,'>Hypersonic<CR>", { desc = 'Regex Help' })
  end,
}
