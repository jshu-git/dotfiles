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

      -- telescope
      TelescopeMatching = { bg = colors.surface2, fg = colors.text },
      TelescopeSelection = { link = 'ColorColumn' },
      TelescopeMultiSelection = { link = 'Visual' },

      -- sentiment
      MatchParen = { link = 'Underlined' },
    }
  end,
  integrations = {
    mini = { indentscope_color = 'overlay0' }, -- NonText
    blink_cmp = true,

    -- disable
    alpha = false,
    dashboard = false,
    fzf = false,
    neotree = false,
    neogit = false,
    cmp = false,
    nvimtree = false,
  },
})

vim.cmd.colorscheme('catppuccin')
