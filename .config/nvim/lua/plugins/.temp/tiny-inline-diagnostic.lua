return {
  -- {
  --   'sontungexpt/better-diagnostic-virtual-text',
  --   config = function()
  --     require('better-diagnostic-virtual-text').setup({
  --       ui = {
  --         above = true,
  --       },
  --     })
  --   end,
  -- },
  -- 'dgagn/diagflow.nvim',
  -- event = 'LspAttach',
  -- config = function()
  --   require('diagflow').setup({
  --     padding_right = 1,
  --   })
  -- end,

  -- 'rachartier/tiny-inline-diagnostic.nvim',
  -- event = 'VeryLazy',
  -- config = function()
  --   -- Default configuration
  --   require('tiny-inline-diagnostic').setup({
  --     -- signs = {
  --     --   left = '',
  --     --   right = '',
  --     --   diag = '●',
  --     --   arrow = '    ',
  --     --   up_arrow = '    ',
  --     --   vertical = ' │',
  --     --   vertical_end = ' └',
  --     -- },
  --     hi = {
  --       -- error = 'DiagnosticError',
  --       -- warn = 'DiagnosticWarn',
  --       -- info = 'DiagnosticInfo',
  --       -- hint = 'DiagnosticHint',
  --       -- arrow = 'NonText',
  --       background = 'Search', -- Can be a highlight or a hexadecimal color (#RRGGBB)
  --       -- mixing_color = require('nord.colors').palette.polar_night.origin, -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
  --     },
  --     blend = {
  --       factor = 100,
  --     },
  --   })
  -- end,

  -- {
  --   "RaafatTurki/corn.nvim",
  --   config = function()
  --     local corn = require("corn")
  --     corn.setup({
  --       icons = {
  --         error = signs.error,
  --         warn = signs.warn,
  --         hint = signs.hint,
  --         info = signs.info,
  --       },
  --       item_preprocess_func = function(item)
  --         return item
  --       end,
  --     })
  --     vim.keymap.set("n", "<leader>tc", corn.toggle, { desc = "Toggle Corn" })
  --   end,
  -- },
}
