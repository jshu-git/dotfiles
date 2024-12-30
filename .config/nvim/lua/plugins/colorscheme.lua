require('catppuccin').setup({
  flavour = 'mocha',
  transparent_background = true,
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
      -- NormalFloat = { link = 'Normal' },
      FloatBorder = { link = 'NonText' },

      -- telescope
      TelescopeMatching = { bg = colors.surface2, fg = colors.text },
      TelescopeSelection = { link = 'ColorColumn' },
      TelescopeMultiSelection = { link = 'Visual' },

      -- mini
      MiniJump = { link = 'SpellRare' },

      -- sentiment
      MatchParen = { link = 'Underlined' },
    }
  end,
  integrations = {
    mini = { indentscope_color = 'overlay0' }, -- NonText
    blink_cmp = true,
    grug_far = true,
    cmp = false,
  },
})

vim.cmd.colorscheme('catppuccin')
