return {
  {
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
        -- focus_alternate_buffer = true,
        -- width = math.floor(require('config.utils').popup.width * 0.3),
        -- height = math.floor(require('config.utils').popup.height * 0.3),
        loop_nav = false,
        highlight = 'Normal:FloatBorder',
        win_extra_options = {
          cursorline = true,
          cursorlineopt = 'number',
        },
        borderchars = require('config.utils').border,
        order_buffers = 'lastused',
        show_indicators = 'after',
      })

      local bmui = require('buffer_manager.ui')
      vim.keymap.set('n', '<Tab>', bmui.toggle_quick_menu)
      -- map('n', '<M-j>', bmui.nav_next, opts)
      -- map('n', '<M-k>', bmui.nav_prev, opts)
    end,
  },
  {
    'echasnovski/mini.bufremove',
    keys = {
      '<leader>D',
    },
    config = function()
      local bufremove = require('mini.bufremove')
      require('mini.bufremove').setup()

      vim.keymap.set(
        'n',
        '<leader>D',
        bufremove.delete,
        { desc = 'Buffer: Delete (Smart)' }
      )
    end,
  },
}
