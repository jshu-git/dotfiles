-- vim.cmd('highlight clear')

local p = {
  bg = '#1b1e28',
  fg = '#cdd6f4',

  red = '#cc6666',
  green = '#b5bd68',
  yellow = '#f0c674',
  blue = '#81a2be',

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
  CurSearch = { fg = p.black, bg = p.yellow },
  CursorLine = { bg = p.bg10 },
  -- DiffAdd = { fg = nil, bg = p.green_bg },
  -- DiffChange = { fg = nil, bg = p.cyan_bg },
  -- DiffDelete = { fg = nil, bg = p.red_bg },
  -- DiffText = { fg = nil, bg = p.yellow_bg },
  EndOfBuffer = { fg = p.bg20 },
  ErrorMsg = { fg = p.white, bg = p.red },
  FloatBorder = { fg = p.bg30 },
  IncSearch = { link = 'CurSearch' },
  LineNr = { fg = p.bg20 },
  MatchParen = { link = 'Underlined' },
  -- NonText = { fg = p.bg10 },
  Pmenu = { bg = p.bg10 },
  PmenuSel = { bg = p.bg20 },
  Search = { fg = p.white, bg = p.bg30 },
  StatusLine = { bg = p.bg10 },
  Visual = { bg = p.bg30 },
  WarningMsg = { fg = p.yellow, bg = nil },
  -- Whitespace = { fg = p.bg10 },

  -- syntax
  Comment = { fg = p.bg50, italic = true },

  -- Other community standard
  Bold = { bold = true },
  Italic = { italic = true },
  Underlined = { underline = true },

  -- -- Patch diff
  -- diffAdded = { fg = p.green },
  -- diffChanged = { fg = p.cyan },
  -- diffFile = { fg = p.yellow },
  -- diffLine = { fg = p.blue },
  -- diffRemoved = { fg = p.red },
  -- Added = { fg = p.green },
  -- Changed = { fg = p.cyan },
  -- Removed = { fg = p.red },

  -- Built-in diagnostic
  DiagnosticError = { fg = p.red },
  DiagnosticHint = { fg = p.bg50 },
  DiagnosticInfo = { fg = p.blue },
  DiagnosticOk = { fg = p.green },
  DiagnosticWarn = { fg = p.yellow },
  DiagnosticUnderlineError = { undercurl = true },
  DiagnosticUnderlineHint = { fg = p.bg50, undercurl = true },
  DiagnosticUnderlineInfo = { fg = p.blue, undercurl = true },
  DiagnosticUnderlineOk = { fg = p.green, undercurl = true },
  DiagnosticUnderlineWarn = { fg = p.yellow, undercurl = true },
  DiagnosticFloatingError = { fg = p.red },
  DiagnosticFloatingHint = { fg = p.bg50 },
  DiagnosticFloatingInfo = { fg = p.blue },
  DiagnosticFloatingOk = { fg = p.green },
  DiagnosticFloatingWarn = { fg = p.yellow },
  DiagnosticVirtualTextError = { link = 'DiagnosticError' },
  DiagnosticVirtualTextWarn = { link = 'DiagnosticWarn' },
  DiagnosticVirtualTextInfo = { link = 'DiagnosticInfo' },
  DiagnosticVirtualTextHint = { link = 'DiagnosticHint' },
  DiagnosticVirtualTextOk = { link = 'DiagnosticOk' },
  DiagnosticSignError = { link = 'DiagnosticError' },
  DiagnosticSignWarn = { link = 'DiagnosticWarn' },
  DiagnosticSignInfo = { link = 'DiagnosticInfo' },
  DiagnosticSignHint = { link = 'DiagnosticHint' },
  DiagnosticSignOk = { link = 'DiagnosticOk' },

  -- lsp
  LspSignatureActiveParameter = { bg = p.bg30 },
  LspInlayHint = { bg = p.bg30, italic = true },

  -- plugins
  -- blink
  BlinkCmpLabel = { fg = p.bg50 },

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
