require('nord').setup({
  terminal_colors = false,
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
    -- hl.CmpItemAbbrMatch = { link = 'DiffText' }
    -- hl.PmenuMatchSel = { fg = c.frost.artic_water, bg = hl.PmenuSel.bg }
    -- hl.PmenuMatch = { fg = c.frost.artic_water, bg = hl.Pmenu.bg }

    -- mini
    hl.MiniIconsAzure = { fg = c.frost.artic_water }

    hl.MiniIconsCyan = { fg = c.frost.polar_water }
    hl.MiniIconsGrey = { fg = c.polar_night.brightest }
    hl.MiniIconsBlue = { fg = c.frost.artic_water }
    hl.MiniIconsRed = { fg = c.aurora.red }
    hl.MiniIconsOrange = { fg = c.aurora.orange }
    hl.MiniIconsYellow = { fg = c.aurora.yellow }
    hl.MiniIconsGreen = { fg = c.aurora.green }
    hl.MiniIconsPurple = { fg = c.aurora.purple }

    hl.MiniDiffSignAdd = { fg = c.aurora.green }
    hl.MiniDiffSignChange = { fg = c.aurora.yellow }
    hl.MiniDiffSignDelete = { fg = c.aurora.red }

    hl.MiniPickPrompt = { link = 'Normal' }
    hl.MiniPickMatchRanges = { link = 'DiffText' }

    hl.MiniStatuslineModeNormal = { fg = c.polar_night.bright, bg = c.frost.ice }
    hl.MiniStatuslineModeVisual = { fg = c.polar_night.bright, bg = c.aurora.green }
    hl.MiniStatuslineModeInsert = { fg = c.polar_night.bright, bg = c.snow_storm.origin }
    hl.MiniStatuslineModeCommand = { fg = c.polar_night.bright, bg = c.aurora.purple }
    hl.MiniStatuslineModeReplace = { fg = c.polar_night.bright, bg = c.aurora.red }

    hl.MiniIndentScopeSymbol = { link = 'NonText' }

    -- copilot
    hl.NeoCodeiumSuggestion = { fg = c.polar_night.brightest }
    hl.NeoCodeiumLabel = { link = 'Search' }
    hl.CopilotSuggestion = { fg = c.polar_night.brightest }
    hl.CopilotAnnotation = { link = 'Search' }

    -- sentiment
    hl.MatchParen = { link = 'Underlined' }

    -- treesitter
    hl.TreesitterContext = { link = 'CursorLine' }

    -- grapple
    hl.GrappleFooter = { link = 'FloatBorder' }
    hl.GrappleCurrent = { link = 'Normal' }

    -- visual-whitespace
    hl.VisualWhitespace = { bg = hl.Visual.bg, fg = c.polar_night.brightest }
  end,
})

vim.cmd.colorscheme('nord')
