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
keymap.set("n", "<leader>n", "<cmd>enew<CR>", { desc = "New buffer" })
-- keymap.set("n", "<Tab>", "<cmd>bn<CR>", { desc = "Next buffer" })
-- keymap.set("n", "<S-Tab>", "<cmd>bp<CR>", { desc = "Previous buffer" })
-- toggles
keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Word Wrap" })

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
keymap.set("n", "U", "<C-r>")
keymap.set("n", "<CR>", "ciw")
keymap.set("n", "<A-CR>", 'ci"')
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
-- keymap.set("x", "p", '"_dP')
keymap.set("n", "<leader>p", "<cmd>pu<CR>==", { desc = "Paste after line" })
keymap.set("n", "<leader>P", "<cmd>pu!<CR>==", { desc = "Paste before line" })

-- windows
keymap.set("n", "<C-h>", "<C-w><C-h>")
keymap.set("n", "<C-l>", "<C-w><C-l>")
keymap.set("n", "<C-j>", "<C-w><C-j>")
keymap.set("n", "<C-k>", "<C-w><C-k>")
-- resizing
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
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- misc
keymap.set("n", "Q", "<nop>")

-- https://old.reddit.com/r/neovim/comments/yk1wqw/dismiss_lsp_pop_us_by_pressing_escape/
-- close any floating window with esc
-- local function close_floating()
-- 	for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 		local config = vim.api.nvim_win_get_config(win)
-- 		if config.relative ~= "" then
-- 			vim.api.nvim_win_close(win, false)
-- 		end
-- 	end
-- end
-- vim.keymap.set("n", "<Esc>", close_floating)
