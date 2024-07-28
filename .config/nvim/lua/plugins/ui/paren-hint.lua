return {
  'briangwaltney/paren-hint.nvim',
  config = function()
    require('paren-hint').setup({
      highlight = 'NonText',
      excluded_filetypes = {},
      excluded_buftypes = {},
    })
  end,
}
