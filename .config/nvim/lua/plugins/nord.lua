return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
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
        vim.api.nvim_set_hl(
          0,
          "MiniDiffSignChange",
          { link = "GitSignsChange" }
        )
        vim.api.nvim_set_hl(
          0,
          "MiniDiffSignDelete",
          { link = "GitSignsDelete" }
        )

        vim.api.nvim_set_hl(
          0,
          "CopilotSuggestion",
          { link = "CodeiumSuggestion" }
        )
        vim.api.nvim_set_hl(
          0,
          "NeoCodeiumSuggestion",
          { link = "CodeiumSuggestion" }
        )
        vim.api.nvim_set_hl(0, "NeoCodeiumLabel", { link = "Search" })
      end,
    })
  end,
  config = function()
    require("nord").setup({
      diff = { mode = "fg" },
      search = { theme = "vscode" },
      styles = {
        comments = { italic = false },
      },
    })
    vim.cmd.colorscheme("nord")
  end,
}
