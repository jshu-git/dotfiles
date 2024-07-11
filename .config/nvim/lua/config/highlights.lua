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

      -- mini icons
      vim.api.nvim_set_hl(0, "MiniIconsAzure", { link = "MiniIconsBlue" })
      vim.api.nvim_set_hl(0, "MiniIconsBlue", { link = "Directory" })
      vim.api.nvim_set_hl(0, "MiniIconsCyan", { fg = "#70D3BF" })
      vim.api.nvim_set_hl(0, "MiniIconsGreen", { link = "Comment" })
      vim.api.nvim_set_hl(0, "MiniIconsGrey", { link = "NonText" })
      vim.api.nvim_set_hl(0, "MiniIconsOrange", { fg = "#f9AE28" })
      vim.api.nvim_set_hl(0, "MiniIconsPurple", { fg = "#AE81FF" })
      -- vim.api.nvim_set_hl(0, "MiniIconsRed", { link = "ErrorMsg" })
      -- vim.api.nvim_set_hl(0, "MiniIconsYellow", { link = "DiagnosticWarn" })

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
