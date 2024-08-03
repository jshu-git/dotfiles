return {
  'chrisgrieser/nvim-rip-substitute',
  keys = {
    -- 'sW',
    { 's/', mode = { 'x' } },
  },
  config = function()
    -- note: full-visual-line makes range matches not work
    local rip = require('rip-substitute')
    rip.setup({
      popupWin = {
        title = 'Rip/Substitute',
        hideSearchReplaceLabels = true,
      },
      prefill = {
        visual = false,
        startInReplaceLineIfPrefill = true,
      },
      keymaps = {
        confirm = '<leader>w',
        abort = '<esc>',
      },
      incrementalPreview = {
        rangeBackdrop = { enabled = false },
      },
    })

    -- rip.rememberCursorWord()
    -- vim.keymap.set('n', 'sW', rip.sub, { desc = 'Rip/Substitute' })
    vim.keymap.set('x', 's/', rip.sub, { desc = 'Rip/Substitute' })
  end,
}
