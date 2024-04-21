-- vim.opt.hlsearch = true
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

local keymap = vim.keymap

-- movement
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "H", '^"0')
keymap.set("n", "L", "g$")
keymap.set("n", "J", "6j")
keymap.set("n", "K", "6k")

-- yanking/pasting
keymap.set("n", "Y", "y$")
keymap.set("n", "p", "p==")
keymap.set("x", "p", '"_dP')

-- windows
keymap.set("n", "<C-h>", "<C-w><C-h>")
keymap.set("n", "<C-l>", "<C-w><C-l>")
keymap.set("n", "<C-j>", "<C-w><C-j>")
keymap.set("n", "<C-k>", "<C-w><C-k>")
-- splits
keymap.set("n", "<C-\\>", "<C-w>v")
keymap.set("n", "<C-->", "<C-w>s")
keymap.set("n", "<A-\\>", "<cmd>vnew<CR>")
keymap.set("n", "<A-->", "<cmd>new<CR>")
-- resizing
keymap.set("n", "<C-Right>", "4<C-w><")
keymap.set("n", "<C-Left>", "4<C-w>>")
keymap.set("n", "<C-Up>", "4<C-w>+")
keymap.set("n", "<C-Down>", "4<C-w>-")

-- search
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- visual modes
keymap.set("x", "v", "j")
keymap.set("x", "V", "j")
keymap.set("x", "<C-v>", "j")

-- changes
keymap.set("n", "U", "<C-r>")
keymap.set("n", "<bs>", "X")
keymap.set("n", "s", "ciw")
keymap.set("n", "x", '"_x') -- delete to black hole register
keymap.set("n", "X", '"_X')
keymap.set("x", "x", '"_x')
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- leader
keymap.set("n", "<leader>w", "<cmd>w<CR>")
keymap.set("n", "<leader>W", "<cmd>w!<CR>")
keymap.set("n", "<leader>q", "<cmd>q<CR>")
keymap.set("n", "<leader>Q", "<cmd>q!<CR>")
keymap.set("n", "<leader>x", "<cmd>bd<CR>")

-- unimpaired
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- toggles
keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>")
