return {
  'gbprod/nord.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        local c = require('nord.colors').palette
        local highlights = {
          -- mini
          MiniIndentScopeSymbol = { link = 'NonText' },
          MiniPickPrompt = { link = 'MiniPickNormal' },
          MiniCursorWord = { link = 'Search' },
          -- icons
          MiniIconsAzure = { fg = c.frost.artic_water },
          MiniIconsBlue = { fg = c.frost.artic_ocean },
          MiniIconsCyan = { fg = c.frost.ice },
          MiniIconsGreen = { fg = c.aurora.green },
          MiniIconsGrey = { fg = c.polar_night.light },
          MiniIconsOrange = { fg = c.aurora.orange },
          MiniIconsPurple = { fg = c.aurora.purple },
          MiniIconsRed = { fg = c.aurora.red },
          MiniIconsYellow = { fg = c.aurora.yellow },
          -- diff
          MiniDiffSignAdd = { link = 'GitSignsAdd' },
          MiniDiffSignChange = { link = 'GitSignsChange' },
          MiniDiffSignDelete = { link = 'GitSignsDelete' },

          -- copilot
          CopilotSuggestion = { link = 'NonText' },
          CopilotAnnotation = { link = 'Search' },
          NeoCodeiumSuggestion = { link = 'NonText' },
          NeoCodeiumLabel = { link = 'Search' },

          -- lspinfo
          LspInfoBorder = { link = 'FloatBorder' },

          -- treesitter
          TreesitterContext = { link = 'CursorLine' },
        }
        for group, hl in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, hl)
        end
      end,
    })
  end,
  config = function()
    require('nord').setup({
      -- diff = { mode = 'fg' },
      search = { theme = 'vscode' },
    })
    vim.cmd.colorscheme('nord')
  end,
}
