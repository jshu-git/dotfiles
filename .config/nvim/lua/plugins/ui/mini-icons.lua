return {
  'echasnovski/mini.icons',
  config = function()
    local icons = require('mini.icons')
    icons.setup({
      filetype = {
        minifiles = { glyph = '󰉋', hl = 'Directory' },
        minipick = { glyph = '󰍉' },
      },
    })
    icons.mock_nvim_web_devicons()
  end,
}
