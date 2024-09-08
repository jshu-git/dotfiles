local icons = require('mini.icons')
icons.setup({
  filetype = {
    minifiles = { glyph = '󰉋', hl = 'Directory' },
    minipick = { glyph = '󰍉' },
    grapple = { glyph = '' },
  },
})
icons.mock_nvim_web_devicons()
icons.tweak_lsp_kind()
