vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "x" }, "<space>", "<nop>")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")

-- leader
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "New Line Below" })
vim.keymap.set("n", "<leader>p", "<cmd>put<CR>", { desc = "Paste After Line" })
vim.keymap.set("n", "<leader>S", "<cmd>so %<CR>", { desc = "Source File" })
vim.keymap.set("n", "<leader>i", "<cmd>Inspect<CR>", { desc = "Inspect" })
vim.keymap.set("n", "<leader>N", "<cmd>enew<CR>", { desc = "New Buffer" })
vim.keymap.set(
  "n",
  "<leader>,",
  "mzA,<Esc>`z:delmarks z<cr>",
  { desc = "Append Comma" }
)
vim.keymap.set(
  "n",
  "<leader>;",
  "mzA;<Esc>`z:delmarks z<cr>",
  { desc = "Append Semicolon" }
)
-- toggles
vim.keymap.set(
  "n",
  "<leader>tw",
  "<cmd>setlocal wrap!<CR>",
  { desc = "Toggle Word Wrap" }
)

-- better movement
vim.keymap.set({ "n", "x" }, "j", function()
  return vim.v.count > 0 and "j" or "gj"
end, { expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
  return vim.v.count > 0 and "k" or "gk"
end, { expr = true })
-- smart 0/^ https://github.com/wscnd/LunarVim/blob/master/lua/keymappings.lua#L98
vim.keymap.set({ "n", "x", "o" }, "0", function()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".") - 1
  return line:sub(1, col):match("^%s+$") and "0" or "^"
end, { expr = true })

-- editing
vim.keymap.set("n", "<BS>", "<C-^>")
vim.keymap.set({ "n", "x" }, ";", ":")
vim.keymap.set({ "n", "x" }, "m", "%")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<CR>", '"_ciw')
vim.keymap.set("n", "i", function()
  return vim.fn.getline(".") == "" and '"_cc' or "i"
end, { expr = true })

-- search
vim.keymap.set("n", "*", "g*N")
vim.keymap.set("n", "g*", "*N")
vim.keymap.set("n", "n", "nzv")
vim.keymap.set("n", "N", "Nzv")

-- preserve clipboard
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set({ "n", "x" }, "C", '"_C')
vim.keymap.set("n", "dD", '"_dd')
vim.keymap.set("n", "dd", function()
  return vim.fn.getline(".") == "" and '"_dd' or "dd"
end, { expr = true })

-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- size
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>")
-- split
vim.keymap.set("n", "<C-v>", "<C-w>v")
vim.keymap.set("n", "<C-s>", "<C-w>s")
-- move
vim.keymap.set("n", "<C-S-J>", "<C-w>J")
vim.keymap.set("n", "<C-S-K>", "<C-w>K")
vim.keymap.set("n", "<C-S-H>", "<C-w>H")
vim.keymap.set("n", "<C-S-L>", "<C-w>L")

-- visual
vim.keymap.set("x", "<CR>", '"_c')
vim.keymap.set("x", "<C-q>", "j")

-- insert/command mode
vim.keymap.set({ "i", "c" }, "<C-h>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-l>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-k>", "<Up>")
vim.keymap.set({ "i", "c" }, "<C-j>", "<Down>")
-- emacs https://github.com/tscolari/nvim/blob/main/lua/keyboard.lua#L26
vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>")
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>")
vim.keymap.set({ "i", "c" }, "<C-d>", "<Del>")
vim.keymap.set({ "i", "c" }, "<A-d>", "<C-Right><C-w>")

-- undo points
for _, key in ipairs({ ",", ".", "!", "?", ":", ";" }) do
  vim.keymap.set("i", key, key .. "<C-g>u")
end
