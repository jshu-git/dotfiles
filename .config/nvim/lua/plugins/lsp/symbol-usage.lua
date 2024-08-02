return {
  'Wansmer/symbol-usage.nvim',
  event = 'LspAttach',
  config = function()
    local symbol_usage = require('symbol-usage')
    symbol_usage.setup({
      hl = {
        italic = true,
        fg = require('nord.colors').palette.polar_night.brighter,
      },
      vt_position = 'end_of_line',
      request_pending_text = false,
      implementation = { enabled = true },
    })

    vim.keymap.set(
      'n',
      '<leader>tv',
      symbol_usage.toggle,
      { desc = 'LSP: Toggle Symbol Usage' }
    )
  end,
}
