-- leader
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "New Line Below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "New Line Above" })
vim.keymap.set("n", "<leader>n", "<cmd>enew<CR>", { desc = "Scratch Buffer" })
vim.keymap.set("n", "<leader>S", "<cmd>so %<CR>", { desc = "Source File" })
-- toggles
vim.keymap.set("n", "<leader>tw", "<cmd>setlocal wrap!<CR>", { desc = "Toggle Word Wrap" })

-- experimenting
vim.keymap.set("n", "<BS>", "<C-^>", { desc = "Alternate Buffer" })
vim.keymap.set({ "n", "x", "o" }, "E", "$")
vim.keymap.set({ "n", "x", "o" }, "B", "^")
-- vim.keymap.set("n", "==", "gg<S-v>Gzz")

-- movement
vim.keymap.set({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
vim.keymap.set({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })
vim.keymap.set({ "n", "x" }, "J", "}zz")
vim.keymap.set({ "n", "x" }, "K", "{zz")
-- vim.keymap.set({ "n", "x", "o" }, "H", "^")
-- vim.keymap.set({ "n", "x", "o" }, "L", "$")
vim.keymap.set({ "n", "x" }, "G", "Gzz")
vim.keymap.set("n", "*", "*zz")
-- non-normal modes
vim.keymap.set({ "i", "c" }, "<C-h>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-l>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-k>", "<Up>")
vim.keymap.set({ "i", "c" }, "<C-j>", "<Down>")

-- editing
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<CR>", '"_ciw')
-- keymap.set("n", "<S-CR>", 'ciq')
vim.keymap.set("n", "<C-r>", ".")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Add Comma" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add Semicolon" })

-- find and replace word under cursor
vim.keymap.set("n", "<leader>r", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Replace Word" })

-- preserve clipboard
vim.keymap.set("n", "<C-x>", '"_dd')
vim.keymap.set("x", "<C-x>", '"_d')
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set({ "n", "x" }, "X", '"_X')
vim.keymap.set({ "n", "x" }, "C", '"_C')

-- yanking/pasting
vim.keymap.set("n", "p", "p==")
vim.keymap.set("v", "p", '"_dP==')
vim.keymap.set("n", "<leader>p", "<cmd>pu<CR>==", { desc = "Paste After Line" })
vim.keymap.set("n", "<leader>P", "<cmd>pu!<CR>==", { desc = "Paste Before Line" })
-- files
vim.keymap.set("n", "gy", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	vim.notify("Copied: " .. vim.fn.expand("%"))
end, { desc = "Copy Path (Relative)" })
vim.keymap.set("n", "gY", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	vim.notify("Copied: " .. vim.fn.expand("%:p"))
end, { desc = "Copy Path (Full)" })

-- window keymaps
vim.keymap.set("n", "<C-v>", "<C-w>v", { desc = "Split Right" })
vim.keymap.set("n", "<C-s>", "<C-w>s", { desc = "Split Below" })
vim.keymap.set("n", "<C-w>0", "<C-w>=", { desc = "Reset Window Size" })

-- visual
vim.keymap.set("x", "<CR>", '"_c')
vim.keymap.set("x", "V", "j")
vim.keymap.set("x", "<C-q>", "j")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- misc
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-f>", "<nop>")
vim.keymap.set("n", "<C-a>", "<nop>")
