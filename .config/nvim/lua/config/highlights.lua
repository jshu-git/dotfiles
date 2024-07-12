vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    if vim.g.colors_name == "nord" then
      -- mini.icons ~/.local/share/nvim/lazy/nord.nvim/lua/nord/colors.lua
      vim.api.nvim_set_hl(0, "MiniIconsAzure", { fg = "#81A1C1" })
      vim.api.nvim_set_hl(0, "MiniIconsBlue", { fg = "#5E81AC" })
      vim.api.nvim_set_hl(0, "MiniIconsCyan", { fg = "#88C0D0" })
      vim.api.nvim_set_hl(0, "MiniIconsGreen", { fg = "#A3BE8C" })
      vim.api.nvim_set_hl(0, "MiniIconsGrey", { fg = "#616E88" })
      vim.api.nvim_set_hl(0, "MiniIconsOrange", { fg = "#D08770" })
      vim.api.nvim_set_hl(0, "MiniIconsPurple", { fg = "#B48EAD" })
      vim.api.nvim_set_hl(0, "MiniIconsRed", { fg = "#BF616A" })
      vim.api.nvim_set_hl(0, "MiniIconsYellow", { fg = "#EBCB8B" })

      vim.api.nvim_set_hl(0, "MiniIndentScopeSymbol", { link = "Whitespace" })
      vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickNormal" })
      vim.api.nvim_set_hl(0, "MiniCursorWord", { link = "Search" })
      vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { link = "GitSignsAdd" })
      vim.api.nvim_set_hl(0, "MiniDiffSignChange", { link = "GitSignsChange" })
      vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { link = "GitSignsDelete" })
    end

    -- if vim.g.colors_name == "arctic" then
    --   -- defaults
    --   -- vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    --   vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    --
    --   -- copilot
    --   vim.api.nvim_set_hl(0, "CopilotSuggestion", { link = "NonText" })
    --   vim.api.nvim_set_hl(0, "CopilotAnnotation", { link = "NonText" })
    --   vim.api.nvim_set_hl(0, "NeoCodeiumSuggestion", { link = "NonText" })
    --   vim.api.nvim_set_hl(0, "NeoCodeiumLabel", { link = "Search" })
    --
    --   -- mini icons
    --   vim.api.nvim_set_hl(0, "MiniIconsAzure", { link = "MiniIconsBlue" })
    --   vim.api.nvim_set_hl(0, "MiniIconsBlue", { link = "Directory" })
    --   vim.api.nvim_set_hl(0, "MiniIconsCyan", { fg = "#70D3BF" })
    --   vim.api.nvim_set_hl(0, "MiniIconsGreen", { link = "Comment" })
    --   vim.api.nvim_set_hl(0, "MiniIconsGrey", { link = "NonText" })
    --   vim.api.nvim_set_hl(0, "MiniIconsOrange", { fg = "#f9AE28" })
    --   vim.api.nvim_set_hl(0, "MiniIconsPurple", { fg = "#AE81FF" })
    --   vim.api.nvim_set_hl(0, "MiniIconsRed", { link = "ErrorMsg" })
    --   vim.api.nvim_set_hl(0, "MiniIconsYellow", { link = "DiagnosticWarn" })
    --
    --   -- mini
    --   vim.api.nvim_set_hl(0, "MiniJump", { link = "Search" })
    --   vim.api.nvim_set_hl(0, "MiniIndentScopeSymbol", { link = "Whitespace" })
    --   vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickNormal" })
    --   vim.api.nvim_set_hl(
    --   0,
    --   "MiniPickMatchRanges",
    --   { link = "MiniPickBorderText" }
    --   )
    --   vim.api.nvim_set_hl(0, "MiniCursorWord", { link = "Search" })
    --   vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { link = "GitSignsAdd" })
    --   vim.api.nvim_set_hl(0, "MiniDiffSignChange", { link = "GitSignsChange" })
    --   vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { link = "GitSignsDelete" })
    --
    --   -- barbar
    --   -- vim.api.nvim_set_hl(0, "BufferTabPageFill", { link = "Normal" })
    --
    --   -- glance
    --   vim.api.nvim_set_hl(0, "GlanceListNormal", { link = "StatusLine" })
    --   vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { link = "StatusLine" })
    --   vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { link = "StatusLine" })
    --   vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { link = "StatusLine" })
    --
    --   -- sentiment
    --   -- vim.api.nvim_set_hl(0, "MatchParen", { link = "Search" })
    -- end
  end,
})
