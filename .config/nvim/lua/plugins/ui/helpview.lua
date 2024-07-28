return {
  'OXY2DEV/helpview.nvim',
  ft = 'help',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    vim.keymap.set(
      'n',
      '<leader>tH',
      '<cmd>Helpview toggleAll<CR>',
      { desc = 'Toggle Helpview' }
    )
  end,
}
