-- nord
-- local palette = {
--   background = "#252312",
--   foreground = "#c8c7c0",
--   base00 = '#2E3440',
--   base01 = '#3B4252',
--   base02 = '#434C5E',
--   base03 = '#4C566A',
--   base04 = '#D8DEE9',
--   base05 = '#E5E9F0',
--   base06 = '#ECEFF4',
--   base07 = '#8FBCBB',
--   base08 = '#88C0D0',
--   base09 = '#81A1C1',
--   base0A = '#5E81AC',
--   base0B = '#BF616A',
--   base0C = '#D08770',
--   base0D = '#EBCB8B',
--   base0E = '#A3BE8C',
--   base0F = '#B48EAD',
-- }
-- end

local hues = require('mini.hues')
-- math.randomseed(vim.loop.hrtime())
-- local base_colors = hues.gen_random_base_colors()
local opts = {
  -- nord
  background = '#2E3440',
  foreground = '#D8DEE9',

  -- random
  -- background = base_colors.background,
  -- foreground = base_colors.foreground,
  -- background = "#252312",
  -- foreground = "#c8c7c0",

  saturation = 'low',
  accent = 'bg',
  plugins = {
    default = false,
    ['echasnovski/mini.nvim'] = true,
    ['hrsh7th/nvim-cmp'] = true,
  },
}
hues.setup(opts)
local p = hues.make_palette(opts)

-- print(vim.inspect(p))
-- {
--   accent = "#d1def9",
--   accent_bg = "#2E3440",

--   bg = "#2E3440",
--   bg_edge = "#1d232e",
--   bg_edge2 = "#0a0f1a",
--   bg_mid = "#474e5b", -- CursorLine, FloatBorder
--   bg_mid2 = "#636977", -- Visual, NonText

--   fg = "#D8DEE9",
--   fg_edge = "#e3e9f4",
--   fg_edge2 = "#eef4ff",
--   fg_mid = "#bac0ca",
--   fg_mid2 = "#9ca2ac",

--   azure = "#c7e2f6",
--   azure_bg = "#213747",
--   blue = "#dbdbf8",
--   blue_bg = "#323148",
--   cyan = "#c0e7e6",
--   cyan_bg = "#183a3b",
--   green = "#cce6d1",
--   green_bg = "#243a29",
--   orange = "#f2d8c4",
--   orange_bg = "#432f1e",
--   purple = "#eed5ea",
--   purple_bg = "#402c3d",
--   red = "#f7d4d5",
--   red_bg = "#462b2d",
--   yellow = "#e1e0c2",
--   yellow_bg = "#37351c"
-- }

local highlights = {
  Comment = { fg = p.fg_mid2, italic = true },
  QuickFixLine = { link = 'CursorLine' },

  -- search
  Search = { bg = '#58637a' }, -- lighten p.bg 25%
  IncSearch = { bg = '#a2abbc' }, -- lighten p.bg 60%
  CurSearch = { link = 'IncSearch' },

  -- floating windows
  NormalFloat = { link = 'Normal' },
  FloatBorder = { fg = p.bg_mid },
  FloatTitle = { link = 'Normal' },
  FloatFooter = { link = 'NonText' },

  -- splits
  VertSplit = { link = 'NonText' },
  WinSeparator = { link = 'NonText' },

  -- cmp
  CmpItemAbbrMatch = { bg = p.bg_mid2 },
  CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },
  CmpItemKindText = { fg = p.fg },

  -- mini
  MiniPickPrompt = { link = 'Normal' },
  MiniPickMatchRanges = { link = 'CmpItemAbbrMatch' },
  MiniIndentScopeSymbol = { link = 'NonText' },
  MiniFilesTitleFocused = { link = 'Normal' },
  MiniFilesBorderModified = { link = 'DiagnosticWarn' },

  -- copilot
  NeoCodeiumSuggestion = { link = 'NonText' },
  NeoCodeiumLabel = { link = 'Search' },
  CopilotSuggestion = { link = 'NonText' },
  CopilotAnnotation = { link = 'Search' },

  -- visual-whitespace
  VisualWhitespace = { fg = p.fg_mid2, bg = p.bg_mid2 }, -- fg=Comment bg=Visual
}
for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end
