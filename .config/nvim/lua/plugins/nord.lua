-- local defaults = {
--   polar_night = {
--     origin = '#2E3440', -- nord0
--     bright = '#3B4252', -- nord1
--     brighter = '#434C5E', -- nord2
--     brightest = '#4C566A', -- nord3
--     light = '#616E88', -- out of palette
--   },
--   snow_storm = {
--     origin = '#D8DEE9', -- nord4
--     brighter = '#E5E9F0', -- nord5
--     brightest = '#ECEFF4', -- nord6
--   },
--   frost = {
--     polar_water = '#8FBCBB', -- nord7
--     ice = '#88C0D0', -- nord8
--     artic_water = '#81A1C1', -- nord9
--     artic_ocean = '#5E81AC', -- nord10
--   },
--   aurora = {
--     red = '#BF616A', -- nord11
--     orange = '#D08770', -- nord12
--     yellow = '#EBCB8B', -- nord13
--     green = '#A3BE8C', -- nord14
--     purple = '#B48EAD', -- nord15
--   },
-- }

require('nord').setup({
  -- diff = { mode = 'fg' },
  search = { theme = 'vscode' },
  on_highlights = function(hl, c)
    hl.NormalFloat = { bg = '#292f3a' } -- darken polar_night.origin 10%

    -- sentiment
    hl.MatchParen = { link = 'Underlined' }

    -- cmp
    hl.BlinkCmpLabel = { fg = c.polar_night.light }
    hl.BlinkCmpLabelMatch = { fg = c.snow_storm.origin }

    -- snacks
    hl.SnacksPickerMatch = { link = 'IncSearch' }
    hl.SnacksPickerDir = { fg = c.polar_night.light } -- Comment
    hl.SnacksPickerFile = { link = 'SnacksPickerDir' }

    -- mini
    hl.MiniFilesTitleFocused = { link = 'Visual' }
    hl.MiniDiffSignAdd = { link = 'DiagnosticOk' }
    hl.MiniDiffSignChange = { link = 'DiagnosticWarn' }
    hl.MiniDiffSignDelete = { link = 'DiagnosticError' }
    hl.MiniIndentScopeSymbol = { link = 'NonText' }

    -- treesitter
    hl.TreesitterContext = { link = 'ColorColumn' }
  end,
})
