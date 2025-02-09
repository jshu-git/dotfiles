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

-- for transparent background to work with cmp pmenu
vim.o.pumblend = 1

require('catppuccin').setup({
  flavour = 'mocha',
  transparent_background = true,
  show_end_of_buffer = true,
  no_bold = true,
  styles = {
    conditionals = {},
  },
  custom_highlights = function(c)
    return {
      VertSplit = { link = 'NonText' },
      WinSeparator = { link = 'VertSplit' },
      FloatBorder = { link = 'NonText' },

      -- cmp
      BlinkCmpLabel = { fg = c.overlay0 },

      -- mini
      MiniJump = { link = 'SpellRare' },
      MiniFilesTitleFocused = { link = 'Visual' },

      -- snacks
      -- SnacksPickerDir = { fg = c.surface2 },
      SnacksPickerFile = { link = 'SnacksPickerDir' },
      -- SnacksPickerMatch = { bg = c.overlay0, fg = c.text },
      SnacksPickerMatch = { link = 'Search' },
      SnacksPickerListCursorLine = { bg = c.surface0 },
      SnacksIndent = { fg = c.surface0 },

      -- sentiment
      MatchParen = { link = 'Underlined' },

      -- treesitter
      TreesitterContext = { link = 'ColorColumn' },

      -- copilot
      CopilotSuggestion = { fg = c.surface1 },
      CopilotAnnotation = { link = 'Search' },
      NeocodeiumSuggestion = { fg = c.surface1 },
      NeocodeiumLabel = { link = 'Search' },
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
    blink_cmp = true,
    treesitter_context = false,
    cmp = false,
  },
})
