return {
  "chrisgrieser/nvim-rip-substitute",
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
        matchHlGroup = "Search",
        rangeBackdrop = {
          enabled = false,
        },
      },
    })

    vim.keymap.set({ "n", "x" }, "sr", function()
      rip.sub()
    end, { desc = "Rip/Substitute" })
  end,
}
