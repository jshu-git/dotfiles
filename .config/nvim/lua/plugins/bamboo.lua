return {
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = 'light'

    require('bamboo').setup({
      code_style = {
        conditionals = { italic = false },
        namespaces = { italic = false },
        parameters = { italic = false },
      },
      highlights = {
        ['@comment'] = { link = 'Comment' },
        QuickFixLine = { link = 'CursorLine' },

        -- mini
        MiniPickPrompt = { link = 'MiniPickNormal' },
        MiniPickMatchRanges = { link = 'CmpItemAbbrMatch' },

        -- copilot
        NeoCodeiumSuggestion = { link = 'NonText' },
        NeoCodeiumLabel = { link = 'Search' },
        CopilotSuggestion = { link = 'NonText' },
        CopilotAnnotation = { link = 'Search' },

        -- sentiment
        MatchParen = { link = 'Underlined' },
      },
    })

    vim.cmd.colorscheme('bamboo')
  end,
}
