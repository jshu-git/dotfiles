return {
  'dnlhc/glance.nvim',
  event = 'LspAttach',
  config = function()
    local glance = require('glance')
    local actions = glance.actions
    glance.setup({
      height = math.floor(0.7 * vim.o.lines),
      border = {
        enable = true,
        top_char = '',
        bottom_char = '▔',
      },
      list = {
        width = 0.2,
      },
      theme = {
        enable = false,
      },
      mappings = {
        list = {
          ['<C-v>'] = actions.jump_vsplit,
          ['<C-s>'] = actions.jump_split,
          ['<C-CR>'] = actions.enter_win('preview'),
          ['<esc>'] = actions.close,
        },
        preview = {
          -- ["<esc>"] = actions.close,
          ['<esc>'] = actions.enter_win('list'),
        },
      },
      folds = {
        folded = false,
      },
    })
  end,
}
