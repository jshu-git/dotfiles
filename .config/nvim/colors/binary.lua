-- vim.cmd('highlight clear')

local p = {
  bg = '#1b1e28',
  fg = '#cdd6f4',

  red = '#732626',
  red_bg = '',
  green = '#61662d',
  green_bg = '',
  yellow = '#f0c674',
  yellow_bg = '',
  cyan = '#30756f',
  cyan_bg = '',
  blue = '#365269',
  blue_bg = '',
  teal = '#5de4c7', -- poimandres

  bg10 = '#2d3242',
  bg20 = '#3f465d',
  bg30 = '#515977',
  bg50 = '#7b85a6',

  white = '#ffffff',
  black = '#000000',
}

vim.api.nvim_set_hl(0, 'Binary', { fg = p.fg })
for group, _ in pairs(vim.api.nvim_get_hl(0, {})) do
  vim.api.nvim_set_hl(0, group, { link = 'Binary' })
end

local highlights = {
  -- builtin
  CursorLine = { bg = p.bg10 },
  EndOfBuffer = { fg = p.bg20 },
  ErrorMsg = { fg = p.white, bg = p.red },
  FloatBorder = { fg = p.bg30 },
  LineNr = { fg = p.bg20 },
  MatchParen = { link = 'Underlined' },
  -- NonText = { fg = p.bg10 },
  StatusLine = { bg = p.bg10 },
  Visual = { bg = p.bg30 },
  WarningMsg = { fg = p.yellow, bg = nil },
  -- Whitespace = { fg = p.bg10 },

  -- search
  CurSearch = { fg = p.black, bg = p.yellow },
  -- IncSearch = { link = 'CurSearch' },
  Search = { fg = p.white, bg = p.bg30 },

  -- pmenu
  Pmenu = { bg = p.bg10 },
  PmenuSel = { bg = p.bg20 },

  -- syntax
  Boolean = { fg = p.teal },
  ['@boolean'] = { link = 'Boolean' },
  Comment = { fg = p.bg50, italic = true },
  ['@comment'] = { link = 'Comment' },
  Number = { fg = p.teal },
  ['@number'] = { link = 'Number' },
  String = { fg = p.teal },
  ['@string'] = { link = 'String' },
  Bold = { bold = true },
  Italic = { italic = true },
  Underlined = { underline = true },

  -- diff
  DiffText = { bg = p.yellow },
  DiffAdd = { bg = p.green },
  DiffChange = { bg = p.cyan },
  DiffDelete = { bg = p.red },
  diffAdded = { fg = p.green },
  diffChanged = { fg = p.cyan },
  diffFile = { fg = p.yellow },
  diffLine = { fg = p.blue },
  diffRemoved = { fg = p.red },
  -- Added = { fg = p.green },
  -- Changed = { fg = p.cyan },
  -- Removed = { fg = p.red },

  -- diag
  DiagnosticError = { fg = p.red },
  DiagnosticHint = { fg = p.cyan },
  DiagnosticInfo = { fg = p.blue },
  DiagnosticOk = { fg = p.green },
  DiagnosticWarn = { fg = p.yellow },
  DiagnosticUnderlineError = { undercurl = true },
  DiagnosticUnderlineHint = { fg = p.cyan, undercurl = true },
  DiagnosticUnderlineInfo = { fg = p.blue, undercurl = true },
  DiagnosticUnderlineOk = { fg = p.green, undercurl = true },
  DiagnosticUnderlineWarn = { fg = p.yellow, undercurl = true },
  -- DiagnosticFloatingError = { link = 'DiagnosticError' },
  -- DiagnosticFloatingHint = { link = 'DiagnosticHint' },
  -- DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
  -- DiagnosticFloatingOk = { link = 'DiagnosticOk' },
  -- DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
  -- DiagnosticVirtualTextError = { link = 'DiagnosticError' },
  -- DiagnosticVirtualTextWarn = { link = 'DiagnosticWarn' },
  -- DiagnosticVirtualTextInfo = { link = 'DiagnosticInfo' },
  -- DiagnosticVirtualTextHint = { link = 'DiagnosticHint' },
  -- DiagnosticVirtualTextOk = { link = 'DiagnosticOk' },
  -- DiagnosticSignError = { link = 'DiagnosticError' },
  -- DiagnosticSignWarn = { link = 'DiagnosticWarn' },
  -- DiagnosticSignInfo = { link = 'DiagnosticInfo' },
  -- DiagnosticSignHint = { link = 'DiagnosticHint' },
  -- DiagnosticSignOk = { link = 'DiagnosticOk' },

  -- lsp
  LspSignatureActiveParameter = { bg = p.bg30 },
  LspInlayHint = { bg = p.bg30, italic = true },

  -- plugins
  -- blink
  BlinkCmpLabel = { fg = p.bg50 },
  BlinkCmpLabelMatch = { fg = p.white },

  -- mini
  -- MiniJump = { reverse = true },
  MiniFilesTitleFocused = { link = 'Visual' },

  -- snacks
  SnacksPickerDir = { fg = p.bg50 },
  SnacksPickerFile = { link = 'SnacksPickerDir' },
  SnacksPickerMatch = { link = 'Search' },
  SnacksPickerListCursorLine = { bg = p.bg10 },
  SnacksIndent = { fg = p.bg20 },

  -- treesitter
  TreesitterContext = { bg = p.bg20 },

  -- copilot
  -- CopilotSuggestion = { fg = c.surface1 },
  -- CopilotAnnotation = { link = 'Search' },
  NeocodeiumSuggestion = { fg = p.bg30 },
  -- NeocodeiumLabel = { link = 'Search' },
  -- TabnineSuggestion = { fg = c.surface1, bg = '#2A2B3C' }, -- bg=CursorLine
}

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end
