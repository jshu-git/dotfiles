-- leader
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "New Line Below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "New Line Above" })
vim.keymap.set("n", "<leader>n", "<cmd>new<CR>", { desc = "Scratch Buffer" })
vim.keymap.set("n", "<leader>S", "<cmd>so %<CR>", { desc = "Source File" })
-- toggles
vim.keymap.set("n", "<leader>tw", "<cmd>setlocal wrap!<CR>", { desc = "Toggle Word Wrap" })

-- movement
vim.keymap.set({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
vim.keymap.set({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })
-- vim.keymap.set({ "n", "x" }, "J", "}zz")
-- vim.keymap.set({ "n", "x" }, "K", "{zz")
vim.keymap.set({ "n", "x" }, "E", "$")
vim.keymap.set({ "n", "x" }, "B", "^")
vim.keymap.set({ "n", "x" }, "G", "Gzz")
vim.keymap.set({ "n", "x" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "x" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "x" }, "}", "}zz")
vim.keymap.set({ "n", "x" }, "{", "{zz")
vim.keymap.set("n", "<BS>", "<C-^>zz")
vim.keymap.set("n", "gG", "ggVG", { desc = "Select All" })

-- editing
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<CR>", '"_ciw')
vim.keymap.set("n", "<C-r>", ".")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Append Comma" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Append Semicolon" })

-- preserve clipboard
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set({ "n", "x" }, "C", '"_C')
vim.keymap.set("n", "dd", function()
	-- smart dd https://old.reddit.com/r/neovim/comments/w0jzzv/smart_dd/
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

-- yanking/pasting
vim.keymap.set("n", "p", "p==")
vim.keymap.set("x", "p", '"_dP==')
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

-- windows
-- focus
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- size
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-w>0", "<C-w>=")
-- split
vim.keymap.set("n", "<C-v>", "<C-w>v")
vim.keymap.set("n", "<C-s>", "<C-w>s")
-- vim.keymap.set("n", "<C-S-V>", "<C-w>v<C-w>h")
-- vim.keymap.set("n", "<C-S-S>", "<C-w>s<C-w>k")
-- move
vim.keymap.set("n", "<C-S-J>", "<C-w>J")
vim.keymap.set("n", "<C-S-K>", "<C-w>K")
vim.keymap.set("n", "<C-S-H>", "<C-w>H")
vim.keymap.set("n", "<C-S-L>", "<C-w>L")

-- visual
vim.keymap.set("x", "<CR>", '"_c')
vim.keymap.set("x", "V", "j")
vim.keymap.set("x", "<C-q>", "j")

-- search and replace
vim.keymap.set("n", "<leader>rs", ":%s///gI<left><left><left><left>", { desc = "Subsitute (File)" })
vim.keymap.set("x", "<leader>rs", ":s///gI<left><left><left><left>", { desc = "Subsitute (Selection)" })

-- non-normal modes
-- vim.keymap.set({ "i", "c" }, "<C-k>", "<Up>")
-- vim.keymap.set({ "i", "c" }, "<C-j>", "<Down>")
vim.keymap.set({ "i", "c" }, "<C-h>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-l>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-d>", "<Del>")
vim.keymap.set({ "i", "c" }, "<C-k>", "<C-o>D")
-- add undo points after , . ! ?
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")
vim.keymap.set("i", ":", ":<C-g>u")
vim.keymap.set("i", ";", ";<C-g>u")
-- hardmode
for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>", "<BS>", "<Del>" }) do
	vim.keymap.set("i", key, "<nop>")
end
