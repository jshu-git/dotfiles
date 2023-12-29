local Util = require("lazyvim.util")
return {
  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>be", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>E", false },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
        end,
        desc = "Explorer (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      window = {
        width = 20,
      },
    },
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      -- find
      { "<leader>fb", false },
      { "<leader>fc", false },
      { "<leader>ff", false },
      { "<leader>fr", false },
      { "<leader>fF", false },
      { "<leader>fR", false },
      -- search
      { '<leader>s"', false },
      { "<leader>sa", false },
      { "<leader>sb", false },
      { "<leader>sf", false },
      { "<leader>sc", false },
      { "<leader>sC", false },
      { "<leader>sd", false },
      { "<leader>sD", false },
      { "<leader>sg", false },
      { "<leader>sG", false },
      { "<leader>sH", false },
      { "<leader>sh", false },
      { "<leader>sk", false },
      { "<leader>k", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", false },
      { "<leader>sm", false },
      { "<leader>so", false },
      { "<leader>sR", false },
      { "<leader>sw", false },
      { "<leader>sW", false },
      { "<leader>sw", false },
      { "<leader>sW", false },
      { "<leader>uC", false },
      { "<leader>ss", false },
      { "<leader>sS", false },
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },

      -- custom
      { "<leader>ff", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current buffer" },
      { "<leader>fw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Find word (root dir)" },
      { "<leader>fW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Find word (cwd)" },
      { "<leader>fw", Util.telescope("grep_string"), mode = "v", desc = "Find selection (root dir)" },
      { "<leader>fW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Find selection (cwd)" },
      { "<leader>fb", Util.telescope("live_grep", { grep_open_files = true }), desc = "Find in open buffers" },
    },
  },
  -- telescope file browser
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>b",
      "<cmd>Telescope file_browser<cr>",
      desc = "Browse Files",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
  -- which-key
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.defaults["<leader>f"] = { name = "+find" }
      opts.defaults["<leader>b"] = nil
      opts.defaults["<leader>q"] = { name = "+quit" }
      opts.defaults["<leader>w"] = nil
      opts.defaults["<leader>s"] = nil
      opts.defaults["<leader>sn"] = nil
    end,
  },
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
}
