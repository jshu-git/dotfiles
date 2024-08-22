return {
  'echasnovski/mini.cursorword',
  keys = { 'gh' },
  config = function()
    require('mini.cursorword').setup({
      delay = 0,
    })
    vim.g.minicursorword_disable = true

    vim.keymap.set('n', 'gh', function()
      vim.g.minicursorword_disable = not vim.g.minicursorword_disable
      -- hack
      vim.api.nvim_command('normal! l')
      vim.defer_fn(function()
        vim.api.nvim_command('normal! h')
      end, 1)
    end, { desc = 'mini.cursorword' })
  end,
}
