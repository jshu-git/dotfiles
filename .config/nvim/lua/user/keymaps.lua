local keymap = vim.keymap
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

-- leader
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All" })
keymap.set("n", "<leader>o", "o<Esc>", { desc = "New Line Below" })
keymap.set("n", "<leader>O", "O<Esc>", { desc = "New Line Above" })
keymap.set("n", "<leader>n", "<cmd>new<CR>", { desc = "New Scratch Buffer" })
keymap.set("n", "<leader>S", "<cmd>so %<CR>", { desc = "Source File" })
-- toggles
keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Word Wrap" })
keymap.set("n", "<leader>tn", "<cmd>set number!<CR>", { desc = "Toggle Line Numbers" })

-- movement
keymap.set({ "n", "x" }, "j", "gj")
keymap.set({ "n", "x" }, "k", "gk")
keymap.set({ "n", "x" }, "H", "^")
keymap.set({ "n", "x" }, "L", "g_")
keymap.set({ "n", "x" }, "J", "6gjzz")
keymap.set({ "n", "x" }, "K", "6gkzz")
keymap.set({ "n", "x" }, "[[", "{zz")
keymap.set({ "n", "x" }, "]]", "}zz")
keymap.set("n", "`", "<C-^>")

-- editing
keymap.set("n", "U", "<C-r>")
keymap.set("n", "<CR>", '"_ciw')
-- keymap.set("n", "<S-CR>", 'ci"')
-- keymap.set("n", "<C-CR>", "ci'")
keymap.set("n", "+", "<C-a>")
keymap.set("n", "_", "<C-x>")
keymap.set("n", "<A-S-j>", "yyp")
keymap.set("n", "<A-S-k>", "yyP")
-- preserve clipboard
keymap.set({ "n", "x" }, "x", '"_x')
keymap.set({ "n", "x" }, "c", '"_c')
keymap.set({ "n", "x" }, "X", '"_X')
keymap.set({ "n", "x" }, "C", '"_C')
-- yanking/pasting
keymap.set("n", "p", "p==")
keymap.set("x", "p", '"_dP==')
keymap.set("n", "<leader>p", "<cmd>pu<CR>==", { desc = "Paste After Line" })
keymap.set("n", "<leader>P", "<cmd>pu!<CR>==", { desc = "Paste Before Line" })

-- windows
keymap.set("n", "<C-h>", "<C-w><C-h>")
keymap.set("n", "<C-l>", "<C-w><C-l>")
keymap.set("n", "<C-j>", "<C-w><C-j>")
keymap.set("n", "<C-k>", "<C-w><C-k>")
keymap.set("n", "<C-Right>", "4<C-w><")
keymap.set("n", "<C-Left>", "4<C-w>>")
keymap.set("n", "<C-Up>", "4<C-w>+")
keymap.set("n", "<C-Down>", "4<C-w>-")

-- search
keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- visual modes
keymap.set("x", "<CR>", "c")
keymap.set("x", "V", "j")
keymap.set("x", "<C-v>", "j")
keymap.set("x", "<C-q>", "j")
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "<C-f>", "<nop>")
