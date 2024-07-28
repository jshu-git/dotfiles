return {
  'gbprod/nord.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        local c = require('nord.colors').palette
        -- mini.icons
        vim.api.nvim_set_hl(0, 'MiniIconsAzure', { fg = c.frost.artic_water })
        vim.api.nvim_set_hl(0, 'MiniIconsBlue', { fg = c.frost.artic_ocean })
        vim.api.nvim_set_hl(0, 'MiniIconsCyan', { fg = c.frost.ice })
        vim.api.nvim_set_hl(0, 'MiniIconsGreen', { fg = c.aurora.green })
        vim.api.nvim_set_hl(0, 'MiniIconsGrey', { fg = c.polar_night.light })
        vim.api.nvim_set_hl(0, 'MiniIconsOrange', { fg = c.aurora.orange })
        vim.api.nvim_set_hl(0, 'MiniIconsPurple', { fg = c.aurora.purple })
        vim.api.nvim_set_hl(0, 'MiniIconsRed', { fg = c.aurora.red })
        vim.api.nvim_set_hl(0, 'MiniIconsYellow', { fg = c.aurora.yellow })

        -- mini.diff
        vim.api.nvim_set_hl(0, 'MiniDiffSignAdd', { link = 'GitSignsAdd' })
        vim.api.nvim_set_hl(
          0,
          'MiniDiffSignChange',
          { link = 'GitSignsChange' }
        )
        vim.api.nvim_set_hl(
          0,
          'MiniDiffSignDelete',
          { link = 'GitSignsDelete' }
        )

        -- mini
        vim.api.nvim_set_hl(0, 'MiniIndentScopeSymbol', { link = 'NonText' })
        vim.api.nvim_set_hl(0, 'MiniPickPrompt', { link = 'MiniPickNormal' })
        vim.api.nvim_set_hl(0, 'MiniCursorWord', { link = 'Search' })

        -- noice
        vim.api.nvim_set_hl(0, 'NoicePopupBorder', { link = 'FloatBorder' })
        vim.api.nvim_set_hl(
          0,
          'NoiceCmdlinePopupBorder',
          { link = 'FloatBorder' }
        )
        vim.api.nvim_set_hl(0, 'NoiceConfirmBorder', { link = 'FloatBorder' })

        -- copilot
        vim.api.nvim_set_hl(0, 'CopilotSuggestion', { link = 'NonText' })
        vim.api.nvim_set_hl(0, 'NeoCodeiumSuggestion', { link = 'NonText' })
        vim.api.nvim_set_hl(0, 'NeoCodeiumLabel', { link = 'Search' })

        -- lspinfo
        vim.api.nvim_set_hl(0, 'LspInfoBorder', { link = 'FloatBorder' })
      end,
    })
  end,
  config = function()
    require('nord').setup({
      diff = { mode = 'fg' },
      search = { theme = 'vscode' },
      -- styles = {
      --   comments = { italic = true },
      --   bufferline = {
      --     modified = { italic = false },
      --   },
      -- },
    })
    vim.cmd.colorscheme('nord')
  end,
}
