return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'light'

      require('nightfox').setup({
        options = {
          styles = {
            comments = 'italic',
          },
        },
        groups = {
          all = {
            NormalFloat = { link = 'Normal' },
            CursorLineNr = { link = 'CursorLineNr' },
            CmpItemAbbrMatch = { link = 'DiagnosticWarn' },

            -- mini
            MiniPickPrompt = { link = 'Normal' },
            MiniPickMatchRanges = { link = 'DiagnosticVirtualTextWarn' },
            MiniIndentScopeSymbol = { link = 'NonText' },

            -- copilot
            NeoCodeiumSuggestion = { link = 'NonText' },
            NeoCodeiumLabel = { link = 'Search' },
            CopilotSuggestion = { link = 'NonText' },
            CopilotAnnotation = { link = 'Search' },

            -- sentiment
            MatchParen = { link = 'Underlined' },

            -- glance
            GlanceWinBarFilename = { link = 'CursorLine' },
            GlanceWinBarFilepath = { link = 'CursorLine' },
            GlanceWinBarTitle = { link = 'CursorLine' },
            GlanceListNormal = { link = 'CursorLine' },
          },
        },
      })

      vim.cmd.colorscheme('dawnfox')
    end,
  },

  {
    enabled = false,
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          local c = require('nord.colors').palette
          require('config.utils').apply_highlights({
            -- mini.icons
            MiniIconsAzure = { fg = c.frost.artic_water },
            MiniIconsBlue = { fg = c.frost.artic_ocean },
            MiniIconsCyan = { fg = c.frost.ice },
            MiniIconsGreen = { fg = c.aurora.green },
            MiniIconsGrey = { fg = c.polar_night.light },
            MiniIconsOrange = { fg = c.aurora.orange },
            MiniIconsPurple = { fg = c.aurora.purple },
            MiniIconsRed = { fg = c.aurora.red },
            MiniIconsYellow = { fg = c.aurora.yellow },

            -- lspinfo
            LspInfoBorder = { link = 'FloatBorder' },

            -- quickfix
            QuickFixLine = { link = 'CursorLine' },
          })
        end,
      })

      require('nord').setup({
        diff = { mode = 'fg' },
        search = { theme = 'vscode' },
      })

      vim.cmd.colorscheme('nord')
    end,
  },
}
