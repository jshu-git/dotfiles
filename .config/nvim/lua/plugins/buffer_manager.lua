return {
  'j-morano/buffer_manager.nvim',
  config = function()
    require('buffer_manager').setup({
      select_menu_item_commands = {
        v = {
          key = '<C-v>',
          command = 'vsplit',
        },
        s = {
          key = '<C-s>',
          command = 'split',
        },
      },
      -- width = math.floor(require('config.utils').popup.width * 0.3),
      -- height = math.floor(require('config.utils').popup.height * 0.3),
      loop_nav = false,
      highlight = 'Normal:FloatBorder',
      borderchars = require('config.utils').border,
      show_indicators = 'after',
    })

    local bmui = require('buffer_manager.ui')
    vim.keymap.set('n', '<Tab>', bmui.toggle_quick_menu)
    -- map('n', '<M-j>', bmui.nav_next, opts)
    -- map('n', '<M-k>', bmui.nav_prev, opts)
  end,
}
