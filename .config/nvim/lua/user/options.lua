local opt = vim.opt

-- line numbers
opt.number = true
-- opt.relativenumber = true

-- tabs/indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = false
opt.incsearch = true

-- ui
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
opt.showmode = false
opt.ruler = false
opt.pumheight = 10
opt.wrap = false

-- windows
opt.splitright = true
opt.splitbelow = true

-- timeouts
opt.timeout = true
opt.timeoutlen = 300
opt.ttimeoutlen = 0
opt.updatetime = 300

-- misc
opt.mouse = "a"
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.inccommand = "split"
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.confirm = true
