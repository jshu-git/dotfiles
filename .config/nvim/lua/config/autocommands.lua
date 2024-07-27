-- yank highlight
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     vim.highlight.on_yank({
--       timeout = require("config.utils").highlight_timeout,
--       higroup = "Search",
--     })
--   end,
-- })

-- disable auto comments
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = { c = false, r = false, o = false }
  end,
})

-- commentstring
vim.api.nvim_create_autocmd("FileType", {
  pattern = "kdl",
  callback = function()
    vim.opt.commentstring = "// %s"
  end,
})

-- hide certain options for some filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "git",
  },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- LazyVim
-- close some filetypes with <esc>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lazy",
    "git",
    "help",
    "gitsigns.blame",
    "checkhealth",
    "qf",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "<esc>",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "*.txt",
    "gitcommit",
    "markdown",
    "noice",
  },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    ---@diagnostic disable-next-line: undefined-field
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
