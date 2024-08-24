require('nord').setup({
  diff = { mode = 'fg' },
  search = { theme = 'vscode' },
  on_highlights = function(highlights, colors)
    highlights.LspInfoBorder = { link = 'FloatBorder' }
    highlights.QuickFixLine = { link = 'CursorLine' }

    -- mini
    highlights.MiniIconsAzure = { fg = colors.frost.artic_water }
    highlights.MiniIconsBlue = { fg = colors.frost.artic_ocean }
    highlights.MiniIconsCyan = { fg = colors.frost.ice }
    highlights.MiniIconsGreen = { fg = colors.aurora.green }
    highlights.MiniIconsGrey = { fg = colors.polar_night.light }
    highlights.MiniIconsOrange = { fg = colors.aurora.orange }
    highlights.MiniIconsPurple = { fg = colors.aurora.purple }
    highlights.MiniIconsRed = { fg = colors.aurora.red }
    highlights.MiniIconsYellow = { fg = colors.aurora.yellow }
    highlights.MiniDiffSignAdd = { link = 'GitSignsAddNr' }
    highlights.MiniDiffSignChange = { link = 'GitSignsChangeNr' }
    highlights.MiniDiffSignDelete = { link = 'GitSignsDeleteNr' }
    highlights.MiniPickPrompt = { link = 'Normal' }

    -- copilot
    highlights.NeoCodeiumSuggestion = { link = 'NonText' }
    highlights.NeoCodeiumLabel = { link = 'Search' }
    highlights.CopilotSuggestion = { link = 'NonText' }
    highlights.CopilotAnnotation = { link = 'Search' }

    -- sentiment
    highlights.MatchParen = { link = 'Underlined' }

    -- noice
    highlights.NoiceCmdLinePopupBorder = { link = 'FloatBorder' }

    -- treesitter
    highlights.TreesitterContext = { link = 'CursorLine' }

    -- glance
    highlights.GlancePreviewEndOfBuffer = { link = 'EndOfBuffer' }
  end,
})
