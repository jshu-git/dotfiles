-- tabs/indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = false
vim.opt.incsearch = true

-- ui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.ruler = false
vim.opt.pumheight = 3
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"
vim.opt.showmode = false
vim.opt.fillchars = { eob = " " }

-- windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- timeouts
vim.opt.timeout = true
vim.opt.timeoutlen = 250
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 1000

-- misc
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.inccommand = "split"
vim.opt.commentstring = "// %s"
