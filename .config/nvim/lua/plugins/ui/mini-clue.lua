return {
  'echasnovski/mini.clue',
  config = function()
    local clue = require('mini.clue')
    clue.setup({
      window = {
        delay = 200,
        config = function(bufnr)
          local max_width = 0
          for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
            max_width = math.max(max_width, vim.fn.strchars(line))
          end
          return {
            width = math.min(40, max_width),
            title_pos = 'center',
          }
        end,
      },
      triggers = {
        -- leader
        { mode = 'n', keys = '<leader>' },
        { mode = 'x', keys = '<leader>' },

        -- g
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- window
        { mode = 'n', keys = '<C-w>' },

        -- folds
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },

        -- unimpaired
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '[' },

        -- surround/substitute operators
        { mode = 'n', keys = 's' },
        { mode = 'x', keys = 's' },
      },
      clues = {
        -- clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),

        -- leader
        { mode = 'n', keys = '<leader>f', desc = 'Find…' },
        { mode = 'n', keys = '<leader>l', desc = 'LSP…' },
        { mode = 'n', keys = '<leader>t', desc = 'Toggle…' },
        { mode = 'n', keys = '<leader>g', desc = 'Git…' },
        { mode = 'x', keys = '<leader>g', desc = 'Git…' },
        { mode = 'n', keys = '<leader>S', desc = 'Session…' },
        { mode = 'n', keys = '<leader>n', desc = 'Noice…' },

        -- submodes
        -- buffers
        -- { mode = 'n', keys = '<leader><Tab>', postkeys = '<leader>' },
        -- { mode = 'n', keys = '<leader><S-Tab>', postkeys = '<leader>' },
        -- folds
        -- { mode = "n", keys = "zj", postkeys = "z" },
        -- { mode = "n", keys = "zk", postkeys = "z" },
        -- { mode = "n", keys = "z=", postkeys = "z" },
        -- { mode = "n", keys = "z-", postkeys = "z" },
        -- { mode = "n", keys = "zo", postkeys = "z" },
        -- { mode = "n", keys = "zc", postkeys = "z" },
      },
    })
  end,

  -- {
  --   'folke/which-key.nvim',
  --   enabled = false,
  --   event = 'VeryLazy',
  --   config = function()
  --     local wk = require('which-key')
  --     wk.setup({
  --       preset = 'helix',
  --       delay = 200,
  --       filter = function(mapping)
  --         return mapping.desc and mapping.desc ~= ''
  --       end,
  --       plugins = {
  --         marks = false,
  --         registers = true,
  --         spelling = { enabled = false },
  --       },
  --       win = {
  --         width = { max = 40 },
  --         height = { max = -1 },
  --         border = 'single',
  --         -- padding = { 0, 0 },
  --       },
  --       sort = { 'group', 'desc' },
  --       icons = {
  --         breadcrumb = '',
  --         separator = '󱦰',
  --         group = '',
  --         mappings = false,
  --       },
  --       show_help = false,
  --       show_keys = false,
  --     })
  --
  --     wk.add({
  --       { '<leader>f', group = 'Find…' },
  --       { '<leader>l', group = 'LSP…' },
  --       { '<leader>t', group = 'Toggle…' },
  --       { { '<leader>g', group = 'Git…' }, mode = { 'n', 'x' } },
  --       { '<leader>s', group = 'Session…' },
  --       { '<leader>n', group = 'Noice…' },
  --     })
  --   end,
  -- },
}
