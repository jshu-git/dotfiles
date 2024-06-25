vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "x" }, "<space>", "<nop>")

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
-- leader
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "New Line Below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "New Line Above" })
vim.keymap.set("n", "<leader>n", "<cmd>enew<CR>", { desc = "Scratch Buffer" })
vim.keymap.set("n", "<leader>S", "<cmd>so %<CR>", { desc = "Source File" })
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>", { desc = "Delete Buffer" })
-- toggles
vim.keymap.set("n", "<leader>tw", "<cmd>setlocal wrap!<CR>", { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>ti", "<cmd>Inspect<CR>", { desc = "Inspect" })

-- movement
vim.keymap.set({ "n", "x" }, "j", function()
	return vim.v.count > 0 and "j" or "gj"
end, { expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
	return vim.v.count > 0 and "k" or "gk"
end, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "J", "5gjzz")
vim.keymap.set({ "n", "x", "o" }, "K", "5gkzz")
vim.keymap.set({ "n", "x" }, "G", "Gzz")
vim.keymap.set({ "n", "x" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "x" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "x" }, "}", "}zz")
vim.keymap.set({ "n", "x" }, "{", "{zz")
vim.keymap.set("n", "<BS>", "<C-^>")
-- smart 0/^ https://github.com/wscnd/LunarVim/blob/master/lua/keymappings.lua#L98
vim.keymap.set({ "n", "x", "o" }, "0", "getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^'", { expr = true })
vim.keymap.set({ "n", "x", "o" }, "9", "$")

-- editing
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<CR>", '"_ciw')
vim.keymap.set("n", "gG", "ggVG", { desc = "Select All" })
vim.keymap.set("n", "<C-r>", ".")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Append Comma" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Append Semicolon" })
-- smart insert
vim.keymap.set("n", "i", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_cc'
	else
		return "i"
	end
end, { expr = true })

-- preserve clipboard
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set({ "n", "x" }, "C", '"_C')
-- smart dd https://old.reddit.com/r/neovim/comments/w0jzzv/smart_dd/
vim.keymap.set("n", "dd", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

-- yanking/pasting
vim.keymap.set("x", "p", '"_dP')
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
vim.keymap.set("n", "<C-w>0", "<C-w>=", { desc = "Reset Window Size" })
-- split
vim.keymap.set("n", "<C-v>", "<C-w>v")
vim.keymap.set("n", "<C-s>", "<C-w>s")
-- move
vim.keymap.set("n", "<C-S-J>", "<C-w>J")
vim.keymap.set("n", "<C-S-K>", "<C-w>K")
vim.keymap.set("n", "<C-S-H>", "<C-w>H")
vim.keymap.set("n", "<C-S-L>", "<C-w>L")

-- substitute (operators)
vim.keymap.set("n", "sf", ":%s/<C-r><C-w>//gI<left><left><left>", { desc = "Substitute cword (File)" })
vim.keymap.set("x", "s/", ":s///gI<left><left><left><left>", { desc = "Substitute in selection" })
-- https://old.reddit.com/r/neovim/comments/1dfvluw/share_your_favorite_settingsfeaturesexcerpts_from/l8qlbs8/
vim.keymap.set("n", "*", "*N")
vim.keymap.set("n", "sw", "g*Ncgn", { desc = "Substitute cword" })
vim.keymap.set(
	"x",
	"sw",
	[[y/\V<C-R>=substitute(escape(@", '/\'), '\n', '\\n', 'g')<NL><CR>Ncgn]],
	{ desc = "Substitute cword selection" }
)
vim.keymap.set("x", "*", [[y/\V<C-R>=substitute(escape(@", '/\'), '\n', '\\n', 'g')<NL><CR>N]])

-- visual
vim.keymap.set("x", "<CR>", '"_c')
vim.keymap.set("x", "V", "j")
vim.keymap.set("x", "<C-q>", "j")

-- insert/command mode (emacs) https://github.com/tscolari/nvim/blob/main/lua/keyboard.lua#L26
vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>")
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>")
vim.keymap.set({ "i", "c" }, "<C-h>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-l>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-k>", "<Up>")
vim.keymap.set({ "i", "c" }, "<C-j>", "<Down>")
vim.keymap.set({ "i", "c" }, "<C-d>", "<Del>")
vim.keymap.set({ "i", "c" }, "<A-d>", "<C-Right><C-w>")

-- undo points
for _, key in ipairs({ ",", ".", "!", "?", ":", ";" }) do
	vim.keymap.set("i", key, key .. "<C-g>u")
end

-- unmaps
for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>", "<Del>" }) do
	vim.keymap.set("i", key, "<Nop>")
end
