local icons = require('mini.icons')
icons.setup({
  filetype = {
    minifiles = { glyph = '󰉋', hl = 'Directory' },
    minipick = { glyph = '󰍉' },
    ['minideps-confirm'] = { glyph = '󰄵' },
    grapple = { glyph = '' },
  },
})
icons.mock_nvim_web_devicons()
