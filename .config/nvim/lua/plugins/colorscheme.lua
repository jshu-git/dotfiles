--
--  bg0  = "#131a24", -- unused
--  bg1  = "#192330", -- Normal bg
--  bg2  = "#212e3f", -- ColorColumn
--  bg3  = "#29394f", -- CursorLine, Whitespace
--  bg4  = "#39506d", -- NonText, Conceal

--  sel0 = "#2b3b51", -- Visual
--  sel1 = "#3c5372", -- Search

--  fg0  = "#d6d6d7", -- Lighter fg
--  fg1  = "#cdcecf", -- Default fg
--  fg2  = "#aeafb0", -- Darker fg (status line)
--  fg3  = "#71839b", -- FloatBorder

--  comment = "#738091",

require('nightfox').setup({
  options = {
    styles = { comments = 'italic' },
    module_default = false,
    modules = {
      cmp = true,
      mini = true,
      -- default
      diagnostic = true,
      native_lsp = true,
      treesitter = true,
    },
  },
  groups = {
    all = {
      QuickFixLine = { link = 'Underlined' },
      EndOfBuffer = { link = 'Conceal' },

      -- floating windows
      NormalFloat = { link = 'Normal' },
      -- FloatBorder = { link = 'Whitespace' },
      FloatTitle = { link = 'Normal' },
      FloatFooter = { link = 'FloatBorder' },

      -- splits
      VertSplit = { link = 'FloatBorder' },
      WinSeparator = { link = 'VertSplit' },

      -- lsp
      LspInfoBorder = { link = 'FloatBorder' },
      LspInlayHint = { fg = 'palette.comment', bg = 'palette.bg2' },

      -- cmp
      CmpItemAbbrMatch = { fg = 'palette.magenta' },
      CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },

      -- mini
      MiniPickPrompt = { link = 'Normal' },
      MiniPickMatchRanges = { link = 'CmpItemAbbrMatch' },
      MiniIndentscopeSymbol = { link = 'NonText' },
      MiniStatuslineFilename = { link = 'Normal' },

      -- treesitter
      TreesitterContext = { link = 'ColorColumn' },

      -- copilot
      NeoCodeiumSuggestion = { link = 'NonText' },
      NeoCodeiumLabel = { link = 'Search' },
      CopilotSuggestion = { link = 'NonText' },
      CopilotAnnotation = { link = 'Search' },

      -- visual-whitespace
      VisualWhitespace = { bg = 'palette.sel0', fg = 'palette.sel1' }, -- bg=Visual, fg=Search
      -- VisualWhitespace = { bg = 'palette.sel0', fg = 'palette.comment' }, -- bg=Visual, fg=Comment

      -- sentiment
      MatchParen = { link = 'Underlined' },
    },
  },
})
vim.cmd('colorscheme nightfox')

-- require('github-theme').setup({
--   options = {
--     hide_end_of_buffer = false,
--     terminal_colors = false,
--     styles = { comments = 'italic' },
--     darken = { floats = false },
--     module_default = false,
--     modules = {
--       cmp = true,
--       mini = true,
--       diagnostic = true,
--       native_lsp = true,
--       treesitter = true,
--       treesitter_context = true,
--     },
--   },
--   groups = {
--     all = {
--       FloatBorder = { link = 'Whitespace' },
--       FloatTitle = { link = 'Normal' },
--       FloatFooter = { link = 'FloatBorder' },
--       QuickFixLine = { link = 'Underlined' },
--       VertSplit = { link = 'Whitespace' },
--       WinSeparator = { link = 'VertSplit' },
--
--       -- mini
--       MiniPickPrompt = { link = 'Normal' },
--       -- MiniPickMatchRanges = { link = 'CmpItemAbbrMatch' },
--       MiniIndentscopeSymbol = { link = 'NonText' },
--
--       -- visual-whitespace
--       VisualWhitespace = { bg = '#304d75', fg = '#8b949e' }, -- bg=Visual, fg=Comment
--
--       -- sentiment
--       MatchParen = { link = 'Underlined' },
--     },
--   },
-- })
-- vim.cmd('colorscheme github_dark')

-- require('nord').setup({
--   terminal_colors = false,
--   diff = { mode = 'fg' },
--   search = { theme = 'vscode' },
--   on_highlights = function(hl, c)
--     -- defaults = {
--     --   polar_night = {
--     --     origin = "#2E3440", -- nord0 Normal
--     --     bright = "#3B4252", -- nord1 CursorLine
--     --     brighter = "#434C5E", -- nord2 Visual, NonText
--     --     brightest = "#4C566A", -- nord3 FloatBorder
--     --     light = "#616E88", -- out of palette Comment
--     --   },
--     --   snow_storm = {
--     --     origin = "#D8DEE9", -- nord4
--     --     brighter = "#E5E9F0", -- nord5
--     --     brightest = "#ECEFF4", -- nord6
--     --   },
--     --   frost = {
--     --     polar_water = "#8FBCBB", -- nord7
--     --     ice = "#88C0D0", -- nord8
--     --     artic_water = "#81A1C1", -- nord9
--     --     artic_ocean = "#5E81AC", -- nord10
--     --   },
--     --   aurora = {
--     --     red = "#BF616A", -- nord11
--     --     orange = "#D08770", -- nord12
--     --     yellow = "#EBCB8B", -- nord13
--     --     green = "#A3BE8C", -- nord14
--     --     purple = "#B48EAD", -- nord15
--     --   },
--     -- }
--
--     hl.LspInfoBorder = { link = 'FloatBorder' }
--     hl.QuickFixLine = { link = 'Underlined' }
--     hl.FloatFooter = { link = 'NonText' }
--
--     -- cmp
--     hl.CmpItemAbbrMatch = { bg = c.polar_night.brightest, fg = c.frost.artic_water }
--     hl.CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' }
--     -- hl.PmenuMatchSel = { fg = c.frost.artic_water, bg = hl.PmenuSel.bg }
--     -- hl.PmenuMatch = { fg = c.frost.artic_water, bg = hl.Pmenu.bg }
--
--     -- mini https://github.com/shaunsingh/nord.nvim/blob/cf312a83afadfadc0a515d41744fffece60ba344/lua/nord/theme.lua
--     -- hl.MiniIconsAzure = { fg = c.frost.ice }
--     hl.MiniIconsAzure = { fg = c.frost.artic_water }
--     hl.MiniIconsBlue = { fg = c.frost.artic_water }
--     hl.MiniIconsCyan = { fg = c.frost.polar_water }
--     hl.MiniIconsGreen = { fg = c.aurora.green }
--     hl.MiniIconsGrey = { fg = c.polar_night.brightest }
--     hl.MiniIconsOrange = { fg = c.aurora.orange }
--     hl.MiniIconsPurple = { fg = c.aurora.purple }
--     hl.MiniIconsRed = { fg = c.aurora.red }
--     hl.MiniIconsYellow = { fg = c.aurora.yellow }
--
--     hl.MiniDiffSignAdd = { fg = c.aurora.green }
--     hl.MiniDiffSignChange = { fg = c.aurora.yellow }
--     hl.MiniDiffSignDelete = { fg = c.aurora.red }
--
--     hl.MiniPickPrompt = { link = 'Normal' }
--     hl.MiniPickMatchRanges = { link = 'CmpItemAbbrMatch' }
--
--     hl.MiniStatuslineFilename = { fg = c.snow_storm.origin, bg = c.polar_night.bright }
--     hl.MiniStatuslineModeNormal = { fg = c.polar_night.bright, bg = c.frost.ice }
--     hl.MiniStatuslineModeVisual = { fg = c.polar_night.bright, bg = c.aurora.green }
--     hl.MiniStatuslineModeInsert = { fg = c.polar_night.bright, bg = c.snow_storm.origin }
--     hl.MiniStatuslineModeCommand = { fg = c.polar_night.bright, bg = c.aurora.purple }
--     hl.MiniStatuslineModeReplace = { fg = c.polar_night.bright, bg = c.aurora.red }
--
--     hl.MiniIndentScopeSymbol = { link = 'NonText' }
--
--     -- copilot
--     hl.NeoCodeiumSuggestion = { fg = c.polar_night.brightest } -- NonText with Cursorline is too dark
--     hl.NeoCodeiumLabel = { link = 'Search' }
--     hl.CopilotSuggestion = { fg = c.polar_night.brightest }
--     hl.CopilotAnnotation = { link = 'Search' }
--
--     -- visual-whitespace
--     hl.VisualWhitespace = { bg = hl.Visual.bg, fg = hl.Comment.fg }
--
--     -- treesitter
--     hl.TreesitterContext = { link = 'CursorLine' }
--     -- hl['@variable.member'] = { fg = c.frost.artic_water }
--     hl['@property'] = { fg = c.frost.artic_water }
--     -- hl['@lsp.type.property'] = { fg = c.frost.artic_water }
--
--     -- sentiment
--     hl.MatchParen = { link = 'Underlined' }
--   end,
-- })
-- vim.cmd.colorscheme('nord')
