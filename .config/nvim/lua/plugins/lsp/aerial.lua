local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('stevearc/aerial.nvim')

  local aerial = require('aerial')
  aerial.setup({
    backends = { 'treesitter', 'lsp' },
    keymaps = {
      ['J'] = 'actions.down_and_scroll',
      ['K'] = 'actions.up_and_scroll',
      ['<esc>'] = 'actions.close',
      ['<Tab>'] = function()
        aerial.select()
        aerial.open({ direction = 'float' })
      end,
    },
    highlight_closest = false,
    highlight_on_hover = true,
    highlight_on_jump = 0,
    show_guides = true,
    float = {
      border = 'single',
      relative = 'win',
    },
  })

  vim.keymap.set('n', 'go', function()
    aerial.toggle({ direction = 'float' })
  end, { desc = 'LSP: Symbols' })
end)
