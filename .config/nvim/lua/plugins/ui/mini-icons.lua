local icons = require('mini.icons')
icons.setup({
  filetype = {
    minifiles = { glyph = '󰉋', hl = 'Directory' },
    minipick = { glyph = '󰍉' },
    ['minideps-confirm'] = { glyph = '󰄵' },
    ['mininotify-history'] = { glyph = '󰋚' },
    -- extra
    -- ['grug-far'] = { glyph = '󰾹' },
    undotree = { glyph = '󰕌' },
    grapple = { glyph = '' },
    lspinfo = { glyph = '󰋽' },
  },
})
icons.mock_nvim_web_devicons()
