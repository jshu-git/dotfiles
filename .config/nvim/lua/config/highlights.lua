vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    if vim.g.colors_name == "arctic" then
      -- defaults
      -- vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })

      -- copilot
      vim.api.nvim_set_hl(0, "CopilotSuggestion", { link = "NonText" })
      vim.api.nvim_set_hl(0, "CopilotAnnotation", { link = "NonText" })
      vim.api.nvim_set_hl(0, "NeoCodeiumSuggestion", { link = "NonText" })
      vim.api.nvim_set_hl(0, "NeoCodeiumLabel", { link = "Search" })

      -- mini
      vim.api.nvim_set_hl(0, "MiniJump", { link = "Search" })
      vim.api.nvim_set_hl(0, "MiniIndentScopeSymbol", { link = "Whitespace" })
      vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickNormal" })
      vim.api.nvim_set_hl(
        0,
        "MiniPickMatchRanges",
        { link = "MiniPickBorderText" }
      )
      vim.api.nvim_set_hl(0, "MiniCursorWord", { link = "Search" })

      -- barbar
      vim.api.nvim_set_hl(0, "BufferTabPageFill", { link = "Normal" })

      -- glance
      vim.api.nvim_set_hl(0, "GlanceListNormal", { link = "StatusLine" })
      vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { link = "StatusLine" })
      vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { link = "StatusLine" })
      vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { link = "StatusLine" })

      -- lsp signature
      vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })

      -- lazygit
      vim.api.nvim_set_hl(0, "LazyGitBorder", { link = "Whitespace" })

      -- sentiment
      vim.api.nvim_set_hl(0, "MatchParen", { link = "Search" })
    end
  end,
})
