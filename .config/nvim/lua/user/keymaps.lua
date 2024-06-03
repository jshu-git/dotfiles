local keymap = vim.keymap

-- leader
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All" })
keymap.set("n", "<leader>o", "o<Esc>", { desc = "New Line Below" })
keymap.set("n", "<leader>O", "O<Esc>", { desc = "New Line Above" })
keymap.set("n", "<leader>n", "<cmd>new<CR>", { desc = "New Scratch Buffer" })
keymap.set("n", "<leader>S", "<cmd>so %<CR>", { desc = "Source File" })
keymap.set("n", "<leader>z", "<cmd>e #<CR>", { desc = "Reopen Last Closed Buffer" })

-- toggles
keymap.set("n", "<leader>tw", "<cmd>setlocal wrap!<CR>", { desc = "Toggle Word Wrap" })

-- movement
keymap.set({ "n", "x" }, "j", "gj")
keymap.set({ "n", "x" }, "k", "gk")
keymap.set({ "n", "x" }, "H", "g^")
keymap.set({ "n", "x" }, "L", "g$")
keymap.set({ "n", "x" }, "J", "6gjzz")
keymap.set({ "n", "x" }, "K", "6gkzz")
keymap.set("n", "]]", "}zz", { desc = "Paragraph forward" })
keymap.set("n", "][", "{zz", { desc = "Paragraph backward" })
keymap.set("n", "[]", "}zz", { desc = "Paragraph forward" })
keymap.set("n", "[[", "{zz", { desc = "Paragraph backward" })
keymap.set("n", "`", "<C-^>")

-- editing
keymap.set("n", ";", ":")
keymap.set("n", "<C-c>", "gcc", { remap = true })
keymap.set("x", "<C-c>", "gc", { remap = true })
keymap.set("n", "U", "<C-r>")
keymap.set("n", "<CR>", '"_ciw')
-- keymap.set("n", "<S-CR>", 'ci"')
-- keymap.set("n", "<C-CR>", "ci'")

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

-- search
keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "*", "*zz")

-- visual modes
keymap.set("x", "<CR>", "c")
keymap.set("x", "V", "j")
keymap.set("x", "<C-q>", "j")
keymap.set("v", "<Tab>", ">gv")
keymap.set("v", "<S-Tab>", "<gv")

-- zellij
keymap.set("n", "<C-f>", "<nop>")
keymap.set("n", "<C-a>", "<nop>")
