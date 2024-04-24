local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

local keymap = vim.keymap

-- movement
keymap.set({ "n", "x" }, "j", "gj")
keymap.set({ "n", "x" }, "k", "gk")
keymap.set({ "n", "x" }, "H", '^"0')
keymap.set({ "n", "x" }, "L", "g$")
keymap.set({ "n", "x" }, "J", "6gjzz")
keymap.set({ "n", "x" }, "K", "6gkzz")
keymap.set({ "n", "x" }, "{", "{zz")
keymap.set({ "n", "x" }, "}", "}zz")

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
-- splits
keymap.set("n", "<C-\\>", "<C-w>v", { desc = "Split vertical" })
keymap.set("n", "<C-->", "<C-w>s", { desc = "Split horizontal" })
keymap.set("n", "<A-\\>", "<cmd>vnew<CR>", { desc = "Split vertical (scratch)" })
keymap.set("n", "<A-->", "<cmd>new<CR>", { desc = "Split horizontal (scratch)" })
-- resizing
keymap.set("n", "<C-Right>", "4<C-w><", { desc = "Increase window right" })
keymap.set("n", "<C-Left>", "4<C-w>>", { desc = "Increase window left" })
keymap.set("n", "<C-Up>", "4<C-w>+", { desc = "Increase window up" })
keymap.set("n", "<C-Down>", "4<C-w>-", { desc = "Increase window down" })

-- search
keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- visual modes
keymap.set("x", "v", "j")
keymap.set("x", "V", "j")
keymap.set("x", "<C-v>", "j")
-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- changes
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<CR>", "ciw", { desc = "Change Inner Word" })
keymap.set("n", "<BS>", "ci", { desc = "Change Inner..." })
keymap.set("n", "x", '"_x') -- delete to black hole register
keymap.set("n", "X", '"_X')
keymap.set("x", "x", '"_x')

-- leader
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
keymap.set("n", "<leader>W", "<cmd>w!<CR>", { desc = "Write (force)" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Quit (force)" })
keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>X", "<cmd>bd!<CR>", { desc = "Close buffer (force)" })

-- unimpaired
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Next Diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Prev Diagnostic" })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- toggles
keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Wrap" })

-- command mode
keymap.set("n", "<Up>", ":")
-- keymap.set("n", ";", ":")
