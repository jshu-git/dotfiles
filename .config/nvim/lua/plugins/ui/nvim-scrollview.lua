return {
  'dstein64/nvim-scrollview',
  config = function()
    require('scrollview').setup({
      signs_on_startup = { 'search' },
      search_symbol = '—',
    })
  end,

  -- {
  --   'echasnovski/mini.map',
  --   config = function()
  --     local map = require('mini.map')
  --     map.setup({
  --       integrations = {
  --         map.gen_integration.builtin_search(),
  --         map.gen_integration.diff(),
  --         map.gen_integration.diagnostic({
  --           error = 'DiagnosticFloatingError',
  --           warn = 'DiagnosticFloatingWarn',
  --           info = 'DiagnosticFloatingInfo',
  --           hint = 'DiagnosticFloatingHint',
  --         }),
  --       },
  --       symbols = {
  --         -- scroll_line = '',
  --         -- scroll_view = '▐',
  --       },
  --       window = {
  --         -- winblend = 100,
  --         show_integration_count = false,
  --       },
  --     })
  --   end,
  -- },
}
