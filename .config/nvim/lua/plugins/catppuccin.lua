-- return {
--   rosewater = '#f5e0dc',
--   flamingo = '#f2cdcd',
--   pink = '#f5c2e7',
--   mauve = '#cba6f7',
--   red = '#f38ba8',
--   maroon = '#eba0ac',
--   peach = '#fab387',
--   yellow = '#f9e2af',
--   green = '#a6e3a1',
--   teal = '#94e2d5',
--   sky = '#89dceb',
--   sapphire = '#74c7ec',
--   blue = '#89b4fa',
--   lavender = '#b4befe',
--   text = '#cdd6f4',
--   subtext1 = '#bac2de',
--   subtext0 = '#a6adc8',
--   overlay2 = '#9399b2',
--   overlay1 = '#7f849c',
--   overlay0 = '#6c7086',
--   surface2 = '#585b70',
--   surface1 = '#45475a',
--   surface0 = '#313244',
--   base = '#1e1e2e',
--   mantle = '#181825',
--   crust = '#11111b',
-- }

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
      -- NormalFloat = { link = 'Normal' },
      FloatBorder = { link = 'NonText' },

      -- cmp
      BlinkCmpLabel = { fg = colors.overlay1 },

      -- mini
      MiniJump = { link = 'SpellRare' },
      MiniFilesTitleFocused = { bg = colors.surface0 },

      -- telescope
      TelescopeNormal = { link = 'NonText' },
      TelescopePromptNormal = { fg = colors.text },
      TelescopeSelection = { link = 'CursorLine' },
      TelescopeMatching = { bg = colors.overlay0, fg = colors.text },
      TelescopeMultiSelection = { link = 'Visual' },

      -- snacks
      -- SnacksPickerDir = { fg = colors.surface2 },
      -- SnacksPickerFile = { fg = colors.overlay2 },
      -- SnacksPickerMatch = { bg = colors.overlay0, fg = colors.text },
      -- SnacksPickerListCursorLine = { bg = colors.surface0 },

      -- sentiment
      MatchParen = { link = 'Underlined' },

      -- treesitter
      TreesitterContext = { link = 'ColorColumn' },
    }
  end,
  integrations = {
    native_lsp = {
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
    },
    mini = { indentscope_color = 'surface1' }, -- NonText
    blink_cmp = true,
    treesitter_context = false,
    cmp = false,
  },
})
