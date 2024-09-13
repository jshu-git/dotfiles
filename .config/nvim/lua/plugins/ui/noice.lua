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
  messages = { view_history = 'popup' },
  popupmenu = { enabled = false },
  commands = {
    history = { view = 'popup' },
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
    signature = { enabled = false },
  },
  presets = {
    lsp_doc_border = true,
    -- cmdline_output_to_split = true,
  },
  views = {
    virtualtext = { hl_group = 'Search' },
    -- split = {
    -- enter = true,
    -- close = { keys = { '<esc>' } },
    -- },
    popup = {
      -- close = { keys = { '<esc>' } },
      border = { style = 'single' },
      size = {
        width = require('utils').popup.width,
        height = require('utils').popup.height,
      },
      win_options = { wrap = true, cursorline = true },
      scrollbar = false,
    },
    hover = {
      border = { style = 'single', padding = { 0, 0 } },
    },
    cmdline_popup = {
      size = { min_width = math.floor(0.2 * vim.o.columns) },
      border = { style = 'single', padding = { 0, 0 } },
    },
    cmdline_input = {
      border = { style = 'single', padding = { 0, 0 } },
    },
    confirm = {
      position = { row = '50%', col = '50%' },
      border = { style = 'single', padding = { 0, 0 } },
    },
  },
  routes = {
    -- macros
    { view = 'virtualtext', filter = { event = 'msg_showmode' } },
    {
      filter = {
        event = 'lsp',
        any = {
          -- zig warning
          { find = 'expected file path' },
        },
      },
      opts = { skip = true },
    },
  },
})

vim.keymap.set('n', '<leader>nn', function()
  noice.cmd('Noice')
  vim.cmd('norm! G')
end, { desc = 'Noice' })

-- amend esc
vim.keymap.set('n', '<esc>', function()
  vim.cmd('nohlsearch')
  vim.cmd('Noice dismiss')
end)
