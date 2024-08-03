return {
  'gbprod/nord.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nord').setup({
      -- diff = { mode = 'fg' },
      search = { theme = 'vscode' },
      on_highlights = function(highlights, colors)
        -- mini.icons
        highlights.MiniIconsAzure = { fg = colors.frost.artic_water }
        highlights.MiniIconsBlue = { fg = colors.frost.artic_ocean }
        highlights.MiniIconsCyan = { fg = colors.frost.ice }
        highlights.MiniIconsGreen = { fg = colors.aurora.green }
        highlights.MiniIconsGrey = { fg = colors.polar_night.light }
        highlights.MiniIconsOrange = { fg = colors.aurora.orange }
        highlights.MiniIconsPurple = { fg = colors.aurora.purple }
        highlights.MiniIconsRed = { fg = colors.aurora.red }
        highlights.MiniIconsYellow = { fg = colors.aurora.yellow }

        -- mini
        highlights.MiniIndentScopeSymbol = { link = 'NonText' }
        highlights.MiniPickPrompt = { link = 'MiniPickNormal' }
        highlights.MiniCursorWord = { link = 'Search' }
        -- diff
        highlights.MiniDiffSignAdd = { link = 'GitSignsAdd' }
        highlights.MiniDiffSignChange = { link = 'GitSignsChange' }
        highlights.MiniDiffSignDelete = { link = 'GitSignsDelete' }

        -- copilot
        highlights.CopilotSuggestion = { link = 'NonText' }
        highlights.CopilotAnnotation = { link = 'Search' }
        highlights.NeoCodeiumSuggestion = { link = 'NonText' }
        highlights.NeoCodeiumLabel = { link = 'Search' }

        -- lspinfo
        highlights.LspInfoBorder = { link = 'FloatBorder' }

        -- treesitter
        highlights.TreesitterContext = { link = 'CursorLine' }
      end,
    })
    vim.cmd.colorscheme('nord')
  end,
}
