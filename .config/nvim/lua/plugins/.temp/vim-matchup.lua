return {
  "andymass/vim-matchup",
  config = function()
    vim.g.matchup_motion_enabled = 1
    vim.g.matchup_transmute_enabled = 1
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_deferred_show_delay = 0
    vim.g.matchup_matchparen_hi_surround_always = 1
    -- vim.g.matchup_matchparen_hi_background = 1
    vim.keymap.set({ "n", "x", "o" }, "m", "<plug>(matchup-%)")
    vim.keymap.set({ "x", "o" }, "im", "<plug>(matchup-i%)")
    vim.keymap.set({ "x", "o" }, "am", "<plug>(matchup-a%)")
    -- vim.keymap.set({ "x", "o" }, "dm", "<plug>(matchup-ds%)")
    -- vim.keymap.set({ "x", "o" }, "cm", "<plug>(matchup-cs%)")
  end,
}
