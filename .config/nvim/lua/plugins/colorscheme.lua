vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local highlights = {
      -- floating windows
      FloatTitle = { link = 'NightflyWhite' },

      -- cmp
      PmenuMatch = { link = 'NightflyOrange' },

      -- mini
      MiniIndentScopeSymbol = { link = 'Whitespace' },
      MiniFilesTitle = { link = 'FloatBorder' },
      MiniFilesTitleFocused = { link = 'FloatTitle' },
    }

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end,
})
vim.g.nightflyNormalFloat = true
vim.g.nightflyUnderlineMatchParen = true
vim.g.nightflyVirtualTextColor = true
vim.g.nightflyWinSeparator = 2

-- nvim-dark
--[[
-- https://old.reddit.com/r/neovim/comments/1bcsa1b/new_default_colorscheme_palette/
-- https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c#L2918

-- #004c73 (Dark blue)
-- #007373 (Dark cyan)
-- #005523 (Dark green)
-- #07080d (Dark grey1)
-- #14161b (Dark grey2) -- Normal bg
-- #2c2e33 (Dark grey3) -- CursorLine, Pmenu
-- #4f5258 (Dark grey4) -- Visual, NonText/Whitespace, FloatBorder
-- #470045 (Dark magenta)
-- #590008 (Dark red)
-- #6b5300 (Dark yellow)

-- #a6dbff (Light blue)
-- #8cf8f7 (Light cyan)
-- #b3f6c0 (Light green)
-- #eef1f8 (Light grey1)
-- #e0e2ea (Light grey2)
-- #c4c6cd (Light grey3)
-- #9b9ea4 (Light grey4) -- Comment
-- #ffcaff (Light magenta)
-- #ffc0b9 (Light red)
-- #fce094 (Light yellow)

local highlights = {
  QuickFixLine = { link = 'CursorLine' },
  Comment = { fg = 'NvimLightGrey4', italic = true },

  -- diff
  Changed = { fg = 'NvimLightYellow' },
  DiffChange = { fg = 'NvimLightYellow' },
  DiffText = { bg = 'NvimDarkYellow' },

  -- floating windows
  NormalFloat = { link = 'Normal' },
  FloatBorder = { link = 'NonText' },
  FloatFooter = { link = 'FloatBorder' },
  WinSeparator = { link = 'FloatBorder' },
  LspInfoBorder = { link = 'FloatBorder' },

  -- cmp
  PmenuSel = { link = 'Visual' },
  PmenuMatchSel = { fg = 'NvimLightCyan', bg = 'NvimDarkGrey4' },
  PmenuMatch = { fg = 'NvimLightCyan', bg = 'NvimDarkGrey3' },

  -- mini
  MiniIconsAzure = { fg = 'NvimLightBlue' },
  MiniIconsCyan = { fg = 'NvimLightCyan' },
  MiniIconsGrey = { fg = 'NvimLightGrey3' },
  MiniIconsBlue = { fg = 'NvimDarkBlue' },
  MiniIconsRed = { fg = 'NvimDarkRed' },
  MiniIconsOrange = { fg = 'NvimLightRed' },
  MiniIconsYellow = { fg = 'NvimLightYellow' },
  MiniIconsGreen = { fg = 'NvimLightGreen' },
  MiniIconsPurple = { fg = 'NvimLightMagenta' },
  MiniIndentScopeSymbol = { link = 'NonText' },
  MiniFilesTitle = { link = 'FloatBorder' },

  -- treesitter
  TreesitterContext = { link = 'CursorLine' },

  -- telescope
  TelescopeTitle = { link = 'FloatTitle' },
  TelescopeBorder = { link = 'FloatBorder' },
  TelescopeMatching = { link = 'Search' },
  TelescopeMultiSelection = { link = 'Search' },
  TelescopeSelection = { link = 'CursorLine' },

  -- sentiment
  MatchParen = { link = 'Underlined' },
}

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end ]]
