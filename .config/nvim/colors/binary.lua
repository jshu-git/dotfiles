vim.cmd('highlight clear')

-- helpers
local brighten = function(color, percentage)
  local hsluv = require('hsluv')
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

-- palette
local M = {
  bg = '#1b1e28', -- poimandres
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

  syntax = '#5de4c7', -- poimandres
  bg10 = brighten(M.bg, 0.1), -- CursorLine, StatusLine
  bg20 = brighten(M.bg, 0.2), -- LineNr, Pmenu
  bg30 = brighten(M.bg, 0.3), -- FloatBorder, Search, Visual, PmenuSel
  bg50 = brighten(M.bg, 0.5), -- Comment, NonText, Whitespace
}

-- override all highlights
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
  NonText = { fg = p.bg50 },
  StatusLine = { bg = p.bg10 },
  TablineSel = { bg = p.bg20 },
  Visual = { bg = p.bg30 },
  Whitespace = { fg = p.bg50 },

  -- msg
  ErrorMsg = { fg = p.red },
  WarningMsg = { fg = p.yellow },
  MsgSeparator = { link = 'Underlined' },

  -- search
  CurSearch = { fg = p.bg, bg = p.yellow },
  Search = { fg = p.fg, bg = p.bg30 },
  IncSearch = { link = 'Search' },

  -- pmenu
  Pmenu = { bg = p.bg20 },
  PmenuSel = { bg = p.bg30 },

  -- syntax
  Boolean = { fg = p.syntax },
  Comment = { fg = p.bg50, italic = true },
  Number = { fg = p.syntax },
  String = { fg = p.syntax },
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
  DiagnosticHint = { fg = p.syntax },
  DiagnosticInfo = { fg = p.blue },
  DiagnosticOk = { fg = p.green },
  DiagnosticWarn = { fg = p.yellow },
  DiagnosticUnderlineError = { fg = p.red, undercurl = true },
  DiagnosticUnderlineHint = { fg = p.syntax, undercurl = true },
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
  LspSignatureActiveParameter = { link = 'Visual' },
  LspInlayHint = { bg = p.bg30, italic = true },

  -- plugins
  -- blink
  BlinkCmpLabel = { fg = p.bg50 },
  BlinkCmpLabelMatch = { fg = p.fg },

  -- mini
  MiniDepsTitleUpdate = { link = 'DiffAdd' },
  MiniDepsTitleSame = { link = 'DiffChange' },
  MiniDepsTitleError = { link = 'DiffDelete' },
  MiniJump = { link = 'DiagnosticUnderlineWarn' },
  MiniFilesTitleFocused = { link = 'Visual' },
  MiniStatuslineModeInsert = { link = 'DiffText' },
  MiniStatuslineModeNormal = { bg = p.bg20 },
  MiniStatuslineDevinfo = { bg = p.bg10 },
  MiniStatuslineFileinfo = { bg = p.bg10 },
  MiniStatuslineFilename = { bg = p.bg },

  -- snacks
  SnacksPickerDir = { fg = p.bg50 },
  SnacksPickerFile = { link = 'SnacksPickerDir' },
  SnacksPickerMatch = { link = 'Search' },
  SnacksPickerListCursorLine = { link = 'CursorLine' },
  SnacksPickerPreviewCursorLine = { link = 'SnacksPickerListCursorLine' },
  SnacksIndent = { fg = p.bg20 },

  -- treesitter
  TreesitterContext = { link = 'CursorLine' },

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
