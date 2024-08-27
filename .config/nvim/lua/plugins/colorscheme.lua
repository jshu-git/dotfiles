require('nord').setup({
  diff = { mode = 'fg' },
  search = { theme = 'vscode' },
  on_highlights = function(hl, c)
    -- defaults = {
    --   polar_night = {
    --     origin = "#2E3440", -- nord0
    --     bright = "#3B4252", -- nord1
    --     brighter = "#434C5E", -- nord2
    --     brightest = "#4C566A", -- nord3
    --     light = "#616E88", -- out of palette
    --   },
    --   snow_storm = {
    --     origin = "#D8DEE9", -- nord4
    --     brighter = "#E5E9F0", -- nord5
    --     brightest = "#ECEFF4", -- nord6
    --   },
    --   frost = {
    --     polar_water = "#8FBCBB", -- nord7
    --     ice = "#88C0D0", -- nord8
    --     artic_water = "#81A1C1", -- nord9
    --     artic_ocean = "#5E81AC", -- nord10
    --   },
    --   aurora = {
    --     red = "#BF616A", -- nord11
    --     orange = "#D08770", -- nord12
    --     yellow = "#EBCB8B", -- nord13
    --     green = "#A3BE8C", -- nord14
    --     purple = "#B48EAD", -- nord15
    --   },
    -- }
    hl.LspInfoBorder = { link = 'FloatBorder' }
    hl.QuickFixLine = { link = 'CursorLine' }
    hl.CmpItemAbbrMatch = { link = 'DiffText' }

    -- mini
    hl.MiniIconsAzure = { fg = c.frost.artic_water }
    hl.MiniIconsBlue = { fg = c.frost.artic_ocean }
    hl.MiniIconsCyan = { fg = c.frost.ice }
    hl.MiniIconsGreen = { fg = c.aurora.green }
    hl.MiniIconsGrey = { fg = c.polar_night.light }
    hl.MiniIconsOrange = { fg = c.aurora.orange }
    hl.MiniIconsPurple = { fg = c.aurora.purple }
    hl.MiniIconsRed = { fg = c.aurora.red }
    hl.MiniIconsYellow = { fg = c.aurora.yellow }

    hl.MiniDiffSignAdd = { link = 'GitSignsAddNr' }
    hl.MiniDiffSignChange = { link = 'GitSignsChangeNr' }
    hl.MiniDiffSignDelete = { link = 'GitSignsDeleteNr' }

    hl.MiniPickPrompt = { link = 'Normal' }
    hl.MiniPickMatchRanges = { link = 'DiffText' }

    hl.MiniStatuslineModeNormal = { fg = c.polar_night.bright, bg = c.frost.ice }
    hl.MiniStatuslineModeVisual = { fg = c.polar_night.bright, bg = c.frost.polar_water }
    hl.MiniStatuslineModeInsert = { fg = c.polar_night.bright, bg = c.snow_storm.origin }
    hl.MiniStatuslineModeCommand = { fg = c.polar_night.bright, bg = c.aurora.purple }

    -- copilot
    hl.NeoCodeiumSuggestion = { link = 'NonText' }
    hl.NeoCodeiumLabel = { link = 'Search' }
    hl.CopilotSuggestion = { link = 'NonText' }
    hl.CopilotAnnotation = { link = 'Search' }

    -- sentiment
    hl.MatchParen = { link = 'Underlined' }

    -- noice
    hl.NoiceCmdLinePopupBorder = { link = 'FloatBorder' }

    -- treesitter
    hl.TreesitterContext = { link = 'CursorLine' }

    -- glance
    hl.GlancePreviewEndOfBuffer = { link = 'EndOfBuffer' }

    -- paren-hint
    -- highlights.ParenHint = { fg = highlights.Comment.fg, bg = highlights.CursorLine.bg }
    hl.ParenHint = { link = 'NonText' }

    -- grapple
    hl.GrappleFooter = { link = 'FloatBorder' }
    hl.GrappleCurrent = { link = 'Normal' }
  end,
})

vim.cmd.colorscheme('nord')
