vim.o.termguicolors = true
vim.cmd('highlight clear')

-- helpers
-- local brighten = function(color, percentage)
--   local hsluv = require('hsluv')
--   local hsl = hsluv.hex_to_hsluv(color)
--   local larpSpace = 100 - hsl[3]
--   if percentage < 0 then
--     larpSpace = hsl[3]
--   end
--   hsl[3] = hsl[3] + larpSpace * percentage
--   return hsluv.hsluv_to_hex(hsl)
-- end

-- palette
local M = {
  bg = '#1b1e28',
  fg = '#cdd6f4',
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
  -- bg10 = brighten(M.bg, 0.1), -- CursorLine
  -- bg20 = brighten(M.bg, 0.2), -- LineNr, Pmenu
  -- bg30 = brighten(M.bg, 0.3), -- FloatBorder, Search, Visual, PmenuSel
  -- bg50 = brighten(M.bg, 0.5), -- Comment, NonText

  bg10 = '#2C303F', -- CursorLine
  bg20 = '#3F4457', -- LineNr, Pmenu
  bg30 = '#525970', -- FloatBorder, Search, Visual, PmenuSel
  bg50 = '#7C85A3', -- Comment, NonText
}

local highlights = {
  -- Normal = { fg = p.fg, bg = p.bg },
  Normal = { fg = p.fg },
  Cursor = { fg = p.bg, bg = p.fg },

  -- builtin
  CursorLine = { bg = p.bg10 },
  Directory = { fg = p.blue },
  FloatBorder = { fg = p.bg30 },
  Folded = { bg = p.bg10 },
  LineNr = { fg = p.bg20 },
  MatchParen = { link = 'Underlined' },
  -- StatusLine = { bg = p.bg10 },
  QuickFixLine = { bg = p.bg20 },
  TablineSel = { bg = p.bg20 },
  Visual = { bg = p.bg30 },
  WinSeparator = { link = 'FloatBorder' },

  -- whitespace
  EndOfBuffer = { fg = p.bg20 },
  NonText = { fg = p.bg50 },
  Whitespace = { link = 'NonText' },
  SnippetTabstop = { link = 'Visual' },

  -- msg
  ErrorMsg = { fg = p.red },
  WarningMsg = { fg = p.yellow },
  MsgSeparator = { fg = p.bg30, underline = true },

  -- search
  CurSearch = { fg = p.bg, bg = p.yellow },
  Search = { fg = p.fg, bg = p.bg30 },
  IncSearch = { link = 'Search' },

  -- pmenu
  Pmenu = { bg = p.bg20 },
  PmenuSel = { link = 'Visual' },

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
  DiffAdd = { fg = p.bg, bg = p.green },
  DiffChange = { fg = p.fg, bg = p.bg20 }, -- changed line
  DiffDelete = { fg = p.bg, bg = p.red },
  DiffText = { fg = p.bg, bg = p.yellow },
  -- patch diff
  diffAdded = { fg = p.green },
  -- diffChanged = { fg = p.cyan },
  diffFile = { fg = p.yellow },
  diffLine = { fg = p.blue },
  diffRemoved = { fg = p.red },
  Added = { link = 'diffAdded' },
  Changed = { link = 'diffChanged' },
  Removed = { link = 'diffRemoved' },
  -- treesitter
  ['@diff.plus'] = { link = 'diffAdded' },
  ['@diff.minus'] = { link = 'diffRemoved' },
  ['@diff.delta'] = { link = 'diffChanged' },

  -- diag
  DiagnosticError = { fg = p.red },
  DiagnosticHint = { fg = p.syntax },
  DiagnosticInfo = { fg = p.blue },
  DiagnosticOk = { fg = p.green },
  DiagnosticWarn = { fg = p.yellow },
  DiagnosticUnderlineError = { sp = p.red, undercurl = true },
  DiagnosticUnderlineHint = { sp = p.syntax, undercurl = true },
  DiagnosticUnderlineInfo = { sp = p.blue, undercurl = true },
  DiagnosticUnderlineOk = { sp = p.green, undercurl = true },
  DiagnosticUnderlineWarn = { sp = p.yellow, undercurl = true },
  DiagnosticFloatingError = { link = 'DiagnosticError' },
  DiagnosticFloatingHint = { link = 'DiagnosticHint' },
  DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
  DiagnosticFloatingOk = { link = 'DiagnosticOk' },
  DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
  DiagnosticDeprecated = { sp = p.yellow, strikethrough = true },
  DiagnosticUnnecessary = { link = 'Comment' },

  -- lsp
  LspSignatureActiveParameter = { link = 'Visual' },
  LspInlayHint = { bg = p.bg30, italic = true },

  -- plugins
  -- blink
  BlinkCmpLabel = { fg = p.bg50 },
  BlinkCmpLabelMatch = { fg = p.fg },
  BlinkCmpDocBorder = { link = 'FloatBorder' },
  BlinkCmpSignatureHelpBorder = { link = 'FloatBorder' },
  BlinkIndent = { fg = p.bg10 },
  BlinkIndentScope = { fg = p.bg30 },

  -- mini
  MiniDepsChangeAdded = { link = 'diffAdded' },
  MiniDepsChangeRemoved = { link = 'diffRemoved' },
  MiniDepsHint = { link = 'DiagnosticHint' },
  MiniDepsInfo = { link = 'DiagnosticInfo' },
  MiniDepsMsgBreaking = { link = 'DiagnosticWarn' },
  MiniDepsPlaceholder = { link = 'Comment' },
  MiniDepsTitleError = { link = 'DiffDelete' },
  MiniDepsTitleSame = { link = 'DiffChange' },
  MiniDepsTitleUpdate = { link = 'DiffAdd' },
  MiniIconsAzure = { link = 'Directory' },
  MiniJump = { link = 'DiagnosticUnderlineWarn' },
  -- MiniJump2dSpot = { link = 'DiagnosticError' },
  -- MiniJump2dSpotAhead = { link = 'MiniJump2dSpot' },
  MiniFilesTitleFocused = { link = 'Visual' },
  -- MiniPickNormal = { fg = p.bg50 },
  -- MiniPickMatchRanges = { fg = p.syntax },
  -- MiniPickPreviewLine = { link = 'Search' },
  MiniStatuslineModeNormal = { link = 'Visual' },
  MiniStatuslineModeInsert = { link = 'MiniStatuslineModeCommand' },
  MiniTrailspace = { bg = p.red },
  -- MiniStatuslineDevinfo = { bg = p.bg10 },
  -- MiniStatuslineFileinfo = { bg = p.bg10 },
  -- MiniStatuslineFilename = { bg = p.bg },

  -- snacks
  SnacksPickerDir = { fg = p.bg50 },
  SnacksPickerFile = { link = 'SnacksPickerDir' },
  SnacksPickerMatch = { link = 'Search' },
  SnacksPickerListCursorLine = { link = 'CursorLine' },
  SnacksPickerPreviewCursorLine = { link = 'SnacksPickerListCursorLine' },

  -- treesitter
  TreesitterContext = { link = 'CursorLine' },
  TreesitterContextLineNumber = { link = 'TreesitterContext' },

  -- copilot
  CopilotSuggestion = { fg = p.bg30 },
  CopilotAnnotation = { link = 'Search' },
  -- CopilotChatHelp = { link = 'NonText' },
  -- NeocodeiumSuggestion = { link = 'CopilotSuggestion' },
  -- NeocodeiumLabel = { link = 'CopilotAnnotation' },
}

-- set highlights
vim.api.nvim_set_hl(0, 'Binary', { fg = p.fg })
for group, _ in pairs(vim.api.nvim_get_hl(0, {})) do
  vim.api.nvim_set_hl(0, group, { link = 'Binary' })
end
for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end
