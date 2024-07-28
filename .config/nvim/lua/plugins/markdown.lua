return {
  'MeanderingProgrammer/markdown.nvim',
  ft = 'markdown',
  dependencies = {
    'echasnovski/mini.icons',
  },
  config = function()
    local markdown = require('render-markdown')
    markdown.setup({
      -- not working in visual for some reason
      -- render_modes = { "n", "c", "x" },
      anti_conceal = {
        enabled = false,
      },
    })

    vim.keymap.set(
      'n',
      '<leader>tM',
      markdown.toggle,
      { desc = 'Toggle Markdown' }
    )
  end,
}
