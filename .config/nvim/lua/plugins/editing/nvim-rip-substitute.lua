local rip = require('rip-substitute')

rip.setup({
  popupWin = {
    hideSearchReplaceLabels = true,
    hideKeymapHints = true,
  },
  prefill = {
    startInReplaceLineIfPrefill = true,
    alsoPrefillReplaceLine = true,
  },
  keymaps = {
    abort = '<esc>',
    confirm = '<leader>w',
  },
  incrementalPreview = {
    rangeBackdrop = {
      blend = 75,
    },
  },
})

vim.keymap.set({ 'n', 'x' }, '<leader>r', rip.sub, { desc = 'RipSubstitute' })
