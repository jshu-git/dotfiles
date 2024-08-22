return {
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
}
