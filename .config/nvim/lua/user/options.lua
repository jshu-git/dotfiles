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
-- vim.opt.cmdheight = 0
-- vim.opt.cursorline = true
-- vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.fillchars = { eob = " " }
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.pumheight = 10
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- timeouts
vim.opt.timeout = true
vim.opt.timeoutlen = 250
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 250

-- misc
vim.opt.mouse = "a"
vim.opt.inccommand = "split"
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.confirm = true
