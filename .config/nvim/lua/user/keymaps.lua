local keymap = vim.keymap
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

-- leader
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
keymap.set("n", "<leader>W", "<cmd>w!<CR>", { desc = "Write (Force)" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Quit (Force)" })
keymap.set("n", "<leader>o", "o<Esc>", { desc = "Open line below" })
keymap.set("n", "<leader>O", "O<Esc>", { desc = "Open line above" })

-- movement
keymap.set({ "n", "x" }, "j", "gj")
keymap.set({ "n", "x" }, "k", "gk")
keymap.set({ "n", "x" }, "H", '^"0')
keymap.set({ "n", "x" }, "L", "g$")
keymap.set({ "n", "x" }, "J", "6gjzz")
keymap.set({ "n", "x" }, "K", "6gkzz")
keymap.set({ "n", "x" }, "{", "{zz")
keymap.set({ "n", "x" }, "}", "}zz")
keymap.set("n", "<A-S-j>", "yyp")
keymap.set("n", "<A-S-k>", "yyP")

-- editing
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<CR>", "ciw", { desc = "Change Inner Word" })
keymap.set("n", "=", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- TODO: shift delete deletes one character to the right
-- preserve clipboard
keymap.set({ "n", "x" }, "x", '"_x')
keymap.set({ "n", "x" }, "c", '"_c')
keymap.set({ "n", "x" }, "X", '"_X')
keymap.set({ "n", "x" }, "C", '"_C')
-- yanking/pasting
keymap.set("n", "Y", "y$")
keymap.set("n", "p", "p==")
keymap.set("x", "p", '"_dP')
keymap.set("n", "<leader>p", "<cmd>pu<CR>==", { desc = "Paste after line" })
keymap.set("n", "<leader>P", "<cmd>pu!<CR>==", { desc = "Paste before line" })

-- windows
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to window left" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to window right" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to window down" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to window up" })
-- resizing
keymap.set("n", "<C-Right>", "4<C-w><", { desc = "Increase window right" })
keymap.set("n", "<C-Left>", "4<C-w>>", { desc = "Increase window left" })
keymap.set("n", "<C-Up>", "4<C-w>+", { desc = "Increase window up" })
keymap.set("n", "<C-Down>", "4<C-w>-", { desc = "Increase window down" })

-- buffers
-- keymap.set("n", "<Tab>", "<cmd>bn<CR>", { desc = "Next buffer" })
-- keymap.set("n", "<S-Tab>", "<cmd>bp<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>n", "<cmd>enew<CR>", { desc = "New buffer" })

-- search
keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- visual modes
keymap.set("x", "V", "j")
keymap.set("x", "<C-v>", "j")
-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- toggles
keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Word Wrap" })
