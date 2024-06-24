-- defaults
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- copilot
vim.api.nvim_set_hl(0, "CopilotSuggestion", { link = "NonText" })
vim.api.nvim_set_hl(0, "CopilotAnnotation", { link = "NonText" })
vim.api.nvim_set_hl(0, "NeoCodeiumSuggestion", { link = "NonText" })
vim.api.nvim_set_hl(0, "NeoCodeiumLabel", { link = "Search" })

-- mini
vim.api.nvim_set_hl(0, "MiniJump", { link = "Search" })
vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickNormal" })

-- barbar
vim.api.nvim_set_hl(0, "BufferTabPageFill", { link = "Normal" })

-- highlight undo
vim.api.nvim_set_hl(0, "HighlightUndo", { link = "Search" })
vim.api.nvim_set_hl(0, "HighlightRedo", { link = "Search" })

-- sentiment
vim.api.nvim_set_hl(0, "MatchParen", { link = "Search" })

-- glance
vim.api.nvim_set_hl(0, "GlanceListNormal", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { link = "StatusLine" })

-- lsp signature
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })

-- lazygit
vim.api.nvim_set_hl(0, "LazyGitBorder", { link = "FloatBorder" })
