local icons = require('mini.icons')
icons.setup({
  filetype = {
    minifiles = { glyph = '󰉋', hl = 'Directory' },
    minipick = { glyph = '󰍉' },
    ['minideps-confirm'] = { glyph = '󰄵' },
    ['mininotify-history'] = { glyph = '󰋚' },
    undotree = { glyph = '󰕌' },
    grapple = { glyph = '󰐃' },
    lspinfo = { glyph = '󰋽' },
  },
})
icons.mock_nvim_web_devicons()
icons.tweak_lsp_kind()
