return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local fzf = require("fzf-lua")
    local actions = require("fzf-lua.actions")
    local height = math.floor(0.6 * vim.o.lines)
    local width = math.floor(0.75 * vim.o.columns)
    fzf.setup({
      -- "max-perf",
      hls = {
        border = "FloatBorder",
      },
      fzf = {
        match = "NonText",
      },
      winopts = {
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = "single",
        preview = {
          default = "bat",
          hidden = "hidden",
          vertical = "down:75%",
          layout = "vertical",
        },
      },
      keymap = {
        -- builtin = {
        --   ["<S-Tab>"] = "toggle-preview-wrap",
        --   ["<Tab>"] = "toggle-preview",
        --   ["<S-Right>"] = "toggle-preview-ccw",
        --   ["<S-Left>"] = "toggle-preview-cw",
        -- },
        fzf = {
          -- todo: make this work conditionally with preview-page
          ["ctrl-f"] = "half-page-down",
          ["ctrl-b"] = "half-page-up",
          ["shift-tab"] = "toggle-preview-wrap",
          ["tab"] = "toggle-preview",
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
        },
        actions = {
          files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
          },
        },
      },
      previewers = {
        bat = { theme = "Nord" },
      },
      files = {
        formatter = "path.filename_first",
        -- default to no hidden
        rg_opts = [[--color=never --files --follow -g "!.git"]],
        fd_opts = [[--color=never --type f --follow --exclude .git]],
        actions = {
          ["ctrl-h"] = { actions.toggle_hidden },
          ["ctrl-y"] = {
            fn = function(selected)
              vim.fn.setreg("+", selected[1])
            end,
            -- exec_silent = true,
          },
        },
      },
      colorschemes = {
        live_preview = false,
        actions = {
          ["tab"] = {
            fn = actions.colorscheme,
            exec_silent = true,
          },
        },
      },
    })

    -- files
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Files" })
    vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Files (Recent)" })
    vim.keymap.set("n", ",", fzf.blines, { desc = "Grep (Buffer)" })

    -- search
    vim.keymap.set(
      "x",
      "<leader>fg",
      fzf.grep_visual,
      { desc = "Grep (Visual)" }
    )
    vim.keymap.set(
      "n",
      "<leader>fw",
      fzf.live_grep_native,
      { desc = "Grep (Live)" }
    )
    vim.keymap.set("n", "<leader>*", fzf.grep_cword, { desc = "Grep (cword)" })

    -- misc
    vim.keymap.set("n", "'", fzf.resume)
    vim.keymap.set(
      "n",
      "<leader>fC",
      fzf.builtin,
      { desc = "Commands (builtin)" }
    )
    vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Help" })
    vim.keymap.set(
      "n",
      "<leader>ft",
      fzf.colorschemes,
      { desc = "Colorschemes" }
    )
    vim.keymap.set("n", "<leader>fl", fzf.highlights, { desc = "Highlights" })
    vim.keymap.set("n", "<leader>fc", fzf.commands, { desc = "Commands" })
    vim.keymap.set("n", '<leader>"', fzf.registers, { desc = "Registers" })
    vim.keymap.set("n", "<leader>fa", fzf.autocmds, { desc = "Autocommands" })
    vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })

    -- neovim api
    fzf.register_ui_select()
  end,
}
