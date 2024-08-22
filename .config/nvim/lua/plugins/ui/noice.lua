return {
  'folke/noice.nvim',
  version = 'v4.4.7',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local noice = require('noice')
    noice.setup({
      cmdline = {
        format = {
          cmdline = false,
          search_down = false,
          search_up = false,
          filter = false,
          lua = false,
          help = false,
          calculator = false,
          input = { view = 'cmdline_popup', title = '' },
        },
      },
      messages = {
        view_history = 'popup',
      },
      popupmenu = { enabled = false },
      commands = {
        history = {
          view = 'popup',
          filter_opts = { reverse = true },
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        signature = {
          auto_open = { enabled = false },
        },
      },
      presets = {
        lsp_doc_border = true,
        cmdline_output_to_split = true,
      },
      views = {
        virtualtext = {
          hl_group = 'Search',
        },
        split = {
          -- enter = true,
          close = { keys = { '<esc>' } },
        },
        popup = {
          close = { keys = { '<esc>' } },
          border = { style = 'single' },
          size = {
            width = require('config.utils').popup.width,
            height = require('config.utils').popup.height,
          },
          win_options = { wrap = true },
        },
        hover = {
          border = { style = 'single', padding = { 0, 1 } },
        },
        cmdline_popup = {
          size = {
            min_width = math.floor(0.3 * vim.o.columns),
          },
          border = { style = 'single', padding = { 0, 0 } },
        },
        cmdline_input = {
          border = { style = 'single', padding = { 0, 0 } },
        },
        confirm = {
          position = {
            row = '50%',
            col = '50%',
          },
          border = { style = 'single', padding = { 0, 0 } },
        },
      },
      routes = {
        -- macros
        {
          view = 'virtualtext',
          filter = { event = 'msg_showmode' },
        },
        {
          filter = {
            event = 'msg_show',
            any = {
              -- search
              -- { find = 'Search hit ' },
              -- write
              { find = '%d+L, %d+B' },
              -- undo/redo
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          opts = { skip = true },
        },
      },
    })

    vim.keymap.set('n', '<leader>nn', function()
      noice.cmd('Noice')
    end, { desc = 'Messages (Noice)' })
    vim.keymap.set('n', '<leader>nN', function()
      vim.cmd('messages')
    end, { desc = 'Messages' })
    -- vim.keymap.set("n", "<leader>nl", function()
    --   noice.cmd("last")
    -- end, { desc = "Last" })
    vim.keymap.set('n', '<leader>nd', function()
      noice.cmd('errors')
    end, { desc = 'Errors' })

    -- amend esc
    vim.keymap.set('n', '<esc>', function()
      vim.cmd('nohlsearch')
      vim.cmd('Noice dismiss')
    end)
  end,
}
