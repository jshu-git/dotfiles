return {
  'cbochs/grapple.nvim',
  keys = {
    '<leader>a',
    '<Tab>',
  },
  config = function()
    local grapple = require('grapple')
    grapple.setup({
      -- style = 'basename',
      win_opts = {
        width = 0.5,
        height = 0.25,
        -- cursorline = true,
      },
    })

    vim.keymap.set('n', '<leader>a', function()
      if grapple.exists() then
        vim.notify('Ungrappled')
      else
        vim.notify('Grappled: ' .. vim.fn.expand('%:t'))
      end
      grapple.toggle()
    end, { desc = 'Grapple' })
    vim.keymap.set('n', '<Tab>', grapple.toggle_tags)

    -- highlights
    require('config.utils').apply_highlights({
      GrappleFooter = { link = 'FloatBorder' },
      GrappleCurrent = { link = 'Normal' },
      -- GrappleName = { link = 'CursorLine' },
    })
  end,

  -- {
  --   'j-morano/buffer_manager.nvim',
  --   config = function()
  --     require('buffer_manager').setup({
  --       select_menu_item_commands = {
  --         v = {
  --           key = '<C-v>',
  --           command = 'vsplit',
  --         },
  --         s = {
  --           key = '<C-s>',
  --           command = 'split',
  --         },
  --       },
  --       -- focus_alternate_buffer = true,
  --       -- width = math.floor(require('config.utils').popup.width * 0.3),
  --       -- height = math.floor(require('config.utils').popup.height * 0.3),
  --       loop_nav = false,
  --       highlight = 'Normal:FloatBorder',
  --       win_extra_options = {
  --         cursorline = true,
  --         cursorlineopt = 'number',
  --       },
  --       borderchars = require('config.utils').border,
  --       order_buffers = 'lastused',
  --       show_indicators = 'after',
  --     })
  --
  --     local bmui = require('buffer_manager.ui')
  --     vim.keymap.set('n', '<Tab>', bmui.toggle_quick_menu)
  --     -- map('n', '<M-j>', bmui.nav_next, opts)
  --     -- map('n', '<M-k>', bmui.nav_prev, opts)
  --   end,
  -- },
  -- {
  --   'otavioschwanck/arrow.nvim',
  --   config = function()
  --     require('arrow').setup({
  --       always_show_path = true,
  --       show_icons = true,
  --       hide_handbook = true,
  --       mappings = {
  --         -- edit = 'e',
  --         delete_mode = 'd',
  --         clear_all_items = 'D',
  --         toggle = '<Tab>',
  --         split_vertical = '<C-v>',
  --         split_horizontal = '<C-s>',
  --         -- quit = 'q',
  --         -- remove = 'x',
  --         next_item = 'j',
  --         prev_item = 'k',
  --       },
  --       separate_save_and_remove = true,
  --       leader_key = '<Tab>',
  --       buffer_leader_key = '`',
  --     })
  --   end,
  -- },
}
