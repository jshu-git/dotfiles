-- https://old.reddit.com/r/neovim/comments/1bcsa1b/new_default_colorscheme_palette/
-- https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c

-- #004c73 (Dark blue)
-- #007373 (Dark cyan)
-- #005523 (Dark green)
-- #07080d (Dark grey1)
-- #14161b (Dark grey2)
-- #2c2e33 (Dark grey3)
-- #4f5258 (Dark grey4)
-- #470045 (Dark magenta)
-- #590008 (Dark red)
-- #6b5300 (Dark yellow)

-- #a6dbff (Light blue)
-- #8cf8f7 (Light cyan)
-- #b3f6c0 (Light green)
-- #eef1f8 (Light grey1)
-- #e0e2ea (Light grey2)
-- #c4c6cd (Light grey3)
-- #9b9ea4 (Light grey4)
-- #ffcaff (Light magenta)
-- #ffc0b9 (Light red)
-- #fce094 (Light yellow)

local highlights = {
  NormalFloat = { link = 'Normal' },
  FloatBorder = { link = 'NonText' },
  LspInfoBorder = { link = 'FloatBorder' },
  QuickFixLine = { link = 'CursorLine' },

  -- cmp
  CmpItemAbbrMatch = { fg = 'NvimLightCyan' },
  CmpItemAbbrMatchFuzzy = { fg = 'NvimLightCyan' },
  -- PmenuMatchSel = { fg = c.frost.artic_water, bg = PmenuSel.bg },
  -- PmenuMatch = { fg = c.frost.artic_water, bg = Pmenu.bg },

  -- mini
  MiniIconsAzure = { fg = 'NvimLightBlue' },
  MiniIconsCyan = { fg = 'NvimLightCyan' },
  MiniIconsGrey = { fg = 'NvimDarkGrey4' },
  MiniIconsBlue = { fg = 'NvimLightBlue' },
  MiniIconsRed = { fg = 'NvimDarkRed' },
  MiniIconsOrange = { fg = 'NvimLightRed' },
  MiniIconsYellow = { fg = 'NvimLightYellow' },
  MiniIconsGreen = { fg = 'NvimLightGreen' },
  MiniIconsPurple = { fg = 'NvimLightMagenta' },
  MiniDiffSignAdd = { fg = 'NvimLightGreen' },
  MiniDiffSignChange = { fg = 'NvimLightYellow' },
  MiniDiffSignDelete = { fg = 'NvimDarkRed' },
  MiniPickPrompt = { link = 'Normal' },
  MiniPickMatchRanges = { link = 'CmpItemAbbrMatch' },
  MiniIndentScopeSymbol = { link = 'NonText' },

  -- copilot
  NeoCodeiumSuggestion = { link = 'NonText' },
  NeoCodeiumLabel = { link = 'Search' },
  CopilotSuggestion = { link = 'NonText' },
  CopilotAnnotation = { link = 'Search' },

  -- sentiment
  MatchParen = { link = 'Underlined' },

  -- treesitter
  TreesitterContext = { link = 'CursorLine' },

  -- grapple
  GrappleFooter = { link = 'NonText' },
  GrappleCurrent = { link = 'Normal' },

  -- visual-whitespace
  VisualWhitespace = { bg = 'NvimDarkGrey4', fg = 'NvimDarkGrey3' },
}

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end
