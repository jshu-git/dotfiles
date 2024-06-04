-- leader
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "New Line Below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "New Line Above" })
vim.keymap.set("n", "<leader>n", "<cmd>new<CR>", { desc = "New Scratch Buffer" })
vim.keymap.set("n", "<leader>S", "<cmd>so %<CR>", { desc = "Source File" })
vim.keymap.set("n", "<leader>z", "<cmd>e #<CR>", { desc = "Reopen Last Closed Buffer" })

-- toggles
vim.keymap.set("n", "<leader>tw", "<cmd>setlocal wrap!<CR>", { desc = "Toggle Word Wrap" })

-- buffers
vim.keymap.set("n", "<Tab>", "<cmd>bn<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<CR>")

-- movement
vim.keymap.set({ "n", "x" }, "j", "gj")
vim.keymap.set({ "n", "x" }, "k", "gk")
vim.keymap.set({ "n", "x", "o" }, "H", "g^")
vim.keymap.set({ "n", "x", "o" }, "L", "g$")
vim.keymap.set({ "n", "x" }, "J", "6gjzz")
vim.keymap.set({ "n", "x" }, "K", "6gkzz")
vim.keymap.set("n", "]]", "}zz", { desc = "Next Paragraph" })
vim.keymap.set("n", "][", "{zz", { desc = "Next Paragraph" })
vim.keymap.set("n", "[]", "}zz", { desc = "Previous paragraph" })
vim.keymap.set("n", "[[", "{zz", { desc = "Previous paragraph" })

-- editing
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<CR>", '"_ciw')
-- keymap.set("n", "<S-CR>", 'ciq')
vim.keymap.set("n", "<C-r>", ".")
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Add Comma" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add Semicolon" })
vim.keymap.set("n", "<leader>L", 'mz$"_x`z', { desc = "Delete Last Character" })
vim.keymap.set("n", "<leader>H", 'mz0"_x`z', { desc = "Delete First Character" })

-- preserve clipboard
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set({ "n", "x" }, "X", '"_X')
vim.keymap.set({ "n", "x" }, "C", '"_C')

-- yanking/pasting
vim.keymap.set("n", "p", "p==")
vim.keymap.set("x", "p", '"_dP==')
vim.keymap.set("n", "<leader>p", "<cmd>pu<CR>==", { desc = "Paste After Line" })
vim.keymap.set("n", "<leader>P", "<cmd>pu!<CR>==", { desc = "Paste Before Line" })

-- search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")

-- window keymaps
vim.keymap.set("n", "<C-v>", "<C-w>v", { desc = "Split Right" })
vim.keymap.set("n", "<C-s>", "<C-w>s", { desc = "Split Below" })
vim.keymap.set("n", "<C-w>V", "<C-w>v<C-w>h", { desc = "Split Right (No Focus)" })
vim.keymap.set("n", "<C-w>S", "<C-w>s<C-w>k", { desc = "Split Below (No Focus)" })

-- resizing
vim.keymap.set("n", "<C-w>0", "<C-w>=", { desc = "Reset Window Size" })
vim.keymap.set("n", "<C-w>-", "<C-w><", { desc = "Decrease width" })
vim.keymap.set("n", "<C-w>=", "<C-w>>", { desc = "Increase width" })
vim.keymap.set("n", "<C-w>_", "<C-w>-", { desc = "Decrease height" })

-- visual
vim.keymap.set("x", "<CR>", '"_c')
vim.keymap.set("x", "V", "j")
vim.keymap.set("x", "<C-q>", "j")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- zellij
vim.keymap.set("n", "<C-f>", "<nop>")
vim.keymap.set("n", "<C-a>", "<nop>")
