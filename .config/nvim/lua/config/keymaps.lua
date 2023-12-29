-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- new file
vim.keymap.del("n", "<leader>fn")

-- buffers
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")

-- LazyVim Changelog
vim.keymap.del("n", "<leader>L")

-- floating terminal
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

-- windows
vim.keymap.set("n", "<leader>w", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<C-W>q", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<C-W>w", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

-- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

-- custom
-- yank to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
-- yank hack: paste without overwriting clipboard
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without overwriting clipboard", remap = true })

vim.keymap.set({ "n", "x" }, "d", '"_d', { desc = "Delete without overwriting clipboard" })
vim.keymap.set({ "n", "x" }, "dd", '"_dd', { desc = "Delete line without overwriting clipboard" })

-- recent files
vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

-- comment
-- vim.keymap.set({ "n", "x" }, "<leader>c", "gcc", { desc = "Comment" })
