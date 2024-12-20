-- https://github.com/bluz71/vim-nightfly-colors/blob/master/lua/nightfly/init.lua
-- local palette = require('nightfly').palette
-- local black = '#011627'
-- local white = '#c3ccdc'
-- local black_blue = '#081e2f'
-- local dark_blue = '#092236'
-- local deep_blue = '#0e293f'
-- local slate_blue = '#2c3043'
-- local pickle_blue = '#38507a'
-- local cello_blue = '#1f4462'
-- local regal_blue = '#1d3b53'
-- local steel_blue = '#4b6479'
-- local grey_blue = '#7c8f8f'
-- local cadet_blue = '#a1aab8'
-- local ash_blue = '#acb4c2'
-- local white_blue = '#d6deeb'
-- local yellow = '#e3d18a'
-- local peach = '#ffcb8b'
-- local tan = '#ecc48d'
-- local orange = '#f78c6c'
-- local orchid = '#e39aa6'
-- local red = '#fc514e'
-- local watermelon = '#ff5874'
-- local purple = '#ae81ff'
-- local violet = '#c792ea'
-- local lavender = '#b0b2f4'
-- local blue = '#82aaff'
-- local malibu = '#87bcff'
-- local turquoise = '#7fdbca'
-- local emerald = '#21c7a8'
-- local green = '#a1cd5e'
-- local cyan_blue = '#296596'
-- local bay_blue = '#24567F'
-- local kashmir_blue = '#4d618e'
-- local plant_green = '#2a4e57'

vim.g.nightflyNormalFloat = true
vim.g.nightflyUnderlineMatchParen = true
vim.g.nightflyVirtualTextColor = true
vim.g.nightflyWinSeparator = 2
local custom_highlight = vim.api.nvim_create_augroup('Nightfly', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'nightfly',
  group = custom_highlight,
  callback = function()
    local highlights = {
      FoldColumn = { link = 'Normal' },

      -- floating windows
      FloatTitle = { link = 'NightflyWhite' },

      -- cmp
      PmenuMatch = { link = 'NightflyOrange' },

      -- mini
      MiniIndentScopeSymbol = { link = 'Whitespace' },
      MiniFilesTitle = { link = 'FloatBorder' },
      MiniFilesTitleFocused = { link = 'FloatTitle' },

      -- telescope
      TelescopeTitle = { link = 'FloatTitle' },
      TelescopeSelection = { link = 'Visual' },

      -- grapple
      GrappleCurrent = { link = 'GrappleName' },
    }

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end,
})

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
