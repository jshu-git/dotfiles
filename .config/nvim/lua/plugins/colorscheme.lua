require('catppuccin').setup({
  flavour = 'mocha',
  show_end_of_buffer = true,
  no_bold = true,
  styles = {
    conditionals = {},
  },
  custom_highlights = function(colors)
    return {
      VertSplit = { link = 'NonText' },
      WinSeparator = { link = 'VertSplit' },

      -- floating windows
      NormalFloat = { link = 'Normal' },
      FloatBorder = { link = 'NonText' },

      -- cmp
      PmenuMatch = { fg = colors.peach },

      -- mini
      -- MiniIndentScopeSymbol = { link = 'NonText' },

      -- telescope
      TelescopeMatching = { link = 'PmenuMatch' },
      TelescopeSelection = { link = 'ColorColumn' },
      TelescopeMultiSelection = { link = 'Visual' },

      -- sentiment
      MatchParen = { link = 'Underlined' },
    }
  end,
})
