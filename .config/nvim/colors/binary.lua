vim.cmd('highlight clear')

local function brighten(color, percentage)
  local hsluv = require('hsluv')
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

local M = {
  bg = '#1b1e28',
  fg = '#ffffff',
}
local p = {
  bg = M.bg,
  fg = M.fg,

  -- catppuccin
  red = '#f38ba8',
  green = '#a6e3a1',
  yellow = '#f9e2af',
  blue = '#89b4fa',

  teal = '#5de4c7', -- syntax (poimandres)
  bg10 = brighten(M.bg, 0.1), -- CursorLine, StatusLine, Pmenu
  bg20 = brighten(M.bg, 0.2), -- LineNr, PmenuSel, SnacksIndent
  bg30 = brighten(M.bg, 0.3), -- FloatBorder, Visual, Search, CopilotSuggestion
  bg50 = brighten(M.bg, 0.5), -- Comment
}

vim.api.nvim_set_hl(0, 'Binary', { fg = p.fg })
for group, _ in pairs(vim.api.nvim_get_hl(0, {})) do
  vim.api.nvim_set_hl(0, group, { link = 'Binary' })
end

local highlights = {
  -- builtin
  CursorLine = { bg = p.bg10 },
  EndOfBuffer = { fg = p.bg20 },
  FloatBorder = { fg = p.bg30 },
  LineNr = { fg = p.bg20 },
  MatchParen = { link = 'Underlined' },
  StatusLine = { bg = p.bg10 },
  TablineSel = { bg = p.bg20 },
  Visual = { bg = p.bg30 },
  -- NonText = { fg = p.bg10 },
  -- Whitespace = { fg = p.bg10 },

  -- msg
  ErrorMsg = { fg = p.red },
  WarningMsg = { fg = p.yellow },
  MsgSeparator = { link = 'Underlined' },

  -- search
  CurSearch = { fg = p.bg, bg = p.yellow },
  Search = { fg = p.fg, bg = p.bg30 },
  IncSearch = { link = 'Search' },

  -- pmenu
  Pmenu = { bg = p.bg10 },
  PmenuSel = { bg = p.bg20 },

  -- syntax
  Boolean = { fg = p.teal },
  Comment = { fg = p.bg50, italic = true },
  Number = { fg = p.teal },
  String = { fg = p.teal },
  -- Bold = { bold = true },
  Italic = { italic = true },
  Underlined = { underline = true },
  -- treesitter
  ['@boolean'] = { link = 'Boolean' },
  ['@comment'] = { link = 'Comment' },
  ['@number'] = { link = 'Number' },
  ['@string'] = { link = 'String' },

  -- diff
  DiffText = { fg = p.bg, bg = p.yellow },
  DiffAdd = { fg = p.bg, bg = p.green },
  DiffChange = { fg = p.fg, bg = p.bg20 },
  DiffDelete = { fg = p.bg, bg = p.red },
  -- diffAdded = { fg = p.green },
  -- diffChanged = { fg = p.yellow },
  -- diffFile = { fg = p.yellow },
  -- diffLine = { fg = },
  -- diffRemoved = { fg = p.red },
  -- Added = { fg = p.green },
  -- Changed = { fg = p.yellow },
  -- Removed = { fg = p.red },

  -- diag
  DiagnosticError = { fg = p.red },
  DiagnosticHint = { fg = p.teal },
  DiagnosticInfo = { fg = p.blue },
  DiagnosticOk = { fg = p.green },
  DiagnosticWarn = { fg = p.yellow },
  DiagnosticUnderlineError = { fg = p.red, undercurl = true },
  DiagnosticUnderlineHint = { fg = p.teal, undercurl = true },
  DiagnosticUnderlineInfo = { fg = p.blue, undercurl = true },
  DiagnosticUnderlineOk = { fg = p.green, undercurl = true },
  DiagnosticUnderlineWarn = { fg = p.yellow, undercurl = true },
  DiagnosticFloatingError = { link = 'DiagnosticError' },
  DiagnosticFloatingHint = { link = 'DiagnosticHint' },
  DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
  DiagnosticFloatingOk = { link = 'DiagnosticOk' },
  DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
  DiagnosticDeprecated = { fg = p.yellow, strikethrough = true },
  DiagnosticUnnecessary = { link = 'Comment' },

  -- lsp
  LspSignatureActiveParameter = { bg = p.bg30 },
  LspInlayHint = { bg = p.bg30, italic = true },

  -- plugins
  -- blink
  BlinkCmpLabel = { fg = p.bg50 },
  BlinkCmpLabelMatch = { fg = p.fg },

  -- mini
  MiniDepsTitleUpdate = { link = 'DiffAdd' },
  MiniDepsTitleSame = { link = 'DiffChange' },
  MiniDepsTitleError = { link = 'DiffDelete' },
  MiniJump = { fg = p.yellow, undercurl = true },
  MiniFilesTitleFocused = { link = 'Visual' },
  MiniStatuslineModeInsert = { link = 'DiffText' },

  -- snacks
  SnacksPickerDir = { fg = p.bg50 },
  SnacksPickerFile = { link = 'SnacksPickerDir' },
  SnacksPickerMatch = { link = 'Search' },
  SnacksPickerListCursorLine = { bg = p.bg10 },
  SnacksIndent = { fg = p.bg20 },

  -- treesitter
  TreesitterContext = { bg = p.bg20 },

  -- copilot
  CopilotSuggestion = { fg = p.bg30 },
  CopilotAnnotation = { link = 'Search' },
  NeocodeiumSuggestion = { fg = p.bg30 },
  NeocodeiumLabel = { link = 'Search' },
  TabnineSuggestion = { fg = p.bg30, bg = p.bg10 },
}

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end
