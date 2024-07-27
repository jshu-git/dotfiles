return {
  "chrisgrieser/nvim-rip-substitute",
  keys = {
    { "sR", mode = { "n", "x" } },
  },
  config = function()
    -- note: full-visual-line makes range matches not work
    local rip = require("rip-substitute")
    rip.setup({
      popupWin = {
        title = "Rip/Substitute",
        hideSearchReplaceLabels = true,
      },
      prefill = {
        startInReplaceLineIfPrefill = true,
      },
      keymaps = {
        confirm = "<leader>w",
        abort = "<esc>",
      },
      incrementalPreview = {
        rangeBackdrop = { enabled = false },
      },
    })

    vim.keymap.set({ "n", "x" }, "sR", function()
      rip.sub()
    end, { desc = "Rip/Substitute" })
  end,
}
