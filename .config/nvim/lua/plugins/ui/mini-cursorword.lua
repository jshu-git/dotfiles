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

    -- highlights
    require('config.utils').apply_highlights({
      MiniCursorWord = { link = 'Search' },
    })

    -- amend esc
    require('keymap-amend')('n', '<esc>', function(original)
      if not vim.g.minicursorword_disable then
        vim.g.minicursorword_disable = true
      end
      original()
    end)
  end,
}
