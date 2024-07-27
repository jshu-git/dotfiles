-- ui
vim.opt.pumblend = 0
vim.opt.pumheight = 5
vim.opt.winblend = 0
vim.opt.splitkeep = "screen"
vim.opt.termguicolors = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars:append({ eob = " " })
-- statusline
vim.opt.laststatus = 3
vim.opt.showcmd = false

-- tabs/indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- search
vim.opt.wrapscan = false
vim.opt.incsearch = false

-- misc
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.confirm = true
