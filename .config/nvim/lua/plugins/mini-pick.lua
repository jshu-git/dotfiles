return {
  "echasnovski/mini.pick",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local pick = require("mini.pick")
    local extra = require("mini.extra")
    -- vim.ui.select = pick.ui_select

    pick.setup({
      mappings = {
        delete_left = "", -- defaults to <C-u>
        move_start = "", -- defaults to <C-g>

        choose_marked = "<C-q>",
        refine = "<C-g>",
        refine_marked = "<C-S-g>",
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
      },
      options = {
        use_cache = true,
      },
      window = {
        config = function()
          -- centered
          local height = math.floor(0.6 * vim.o.lines)
          local width = math.floor(0.75 * vim.o.columns)
          return {
            anchor = "NW",
            height = height,
            width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
          }
        end,
        prompt_prefix = " ",
      },
    })

    -- helpers
    local function get_cwd_opts(name)
      return {
        source = { name = name .. " (" .. vim.fn.getcwd() .. ")" },
      }
    end
    local function get_relative_opts(name)
      local relative_path = vim.fn.expand("%:p:h")
      return {
        source = {
          name = name .. " (" .. relative_path .. ")",
          cwd = relative_path,
        },
      }
    end

    -- files
    vim.keymap.set("n", "<leader>ff", function()
      pick.builtin.files({}, get_cwd_opts("Files"))
    end, { desc = "Files" })
    vim.keymap.set("n", "<leader>fF", function()
      pick.builtin.files({}, get_relative_opts("Files"))
    end, { desc = "Files (Relative)" })
    vim.keymap.set(
      "n",
      "<leader>fr",
      extra.pickers.oldfiles,
      { desc = "Recent Files" }
    )
    vim.keymap.set("n", "<leader>fR", function()
      extra.pickers.oldfiles({ current_dir = true })
    end, { desc = "Recent Files (cwd)" })

    -- grep live
    vim.keymap.set("n", "<leader>fw", function()
      pick.builtin.grep_live({}, get_cwd_opts("Grep Live"))
    end, { desc = "Grep Live" })
    vim.keymap.set("n", "<leader>fW", function()
      pick.builtin.grep_live({}, get_relative_opts("Grep Live"))
    end, { desc = "Grep Live (Relative)" })

    -- grep
    -- vim.keymap.set("n", "<leader>fg", function()
    --   local input = vim.fn.input("Grep (cwd): ")
    --   if input ~= "" then
    --     local opts = get_cwd_opts("Grep")
    --     opts.source.name = opts.source.name .. ": " .. input
    --     pick.builtin.grep({ pattern = input }, opts)
    --   end
    -- end, { desc = "Grep" })
    -- vim.keymap.set("n", "<leader>fG", function()
    --   local input = vim.fn.input("Grep (Relative): ")
    --   if input ~= "" then
    --     local opts = get_relative_opts("Grep")
    --     opts.source.name = opts.source.name .. ": " .. input
    --     pick.builtin.grep({ pattern = input }, opts)
    --   end
    -- end, { desc = "Grep (Relative)" })

    -- grep cword
    vim.keymap.set("n", "<leader>*", function()
      local cword = vim.fn.expand("<cword>")
      local opts = get_cwd_opts("Grep cword")
      opts.source.name = opts.source.name .. ": " .. cword
      pick.builtin.grep({ pattern = cword }, opts)
    end, { desc = "Grep cword" })
    vim.keymap.set("n", "<leader>#", function()
      local cword = vim.fn.expand("<cword>")
      local opts = get_relative_opts("Grep cword")
      opts.source.name = opts.source.name .. ": " .. cword
      pick.builtin.grep({ pattern = cword }, opts)
    end, { desc = "Grep cword (Relative)" })

    -- grep buffer(s)
    vim.keymap.set("n", ",", function()
      extra.pickers.buf_lines({ scope = "current" })
    end, { desc = "Grep Buffer (Current)" })
    vim.keymap.set("n", "<leader>/", function()
      extra.pickers.buf_lines({ scope = "all" })
    end, { desc = "Grep Buffer (All)" })

    -- git
    -- vim.keymap.set(
    --   "n",
    --   "<leader>gc",
    --   extra.pickers.git_commits,
    --   { desc = "Commits" }
    -- )

    -- special paths
    vim.keymap.set("n", "<leader>fp", function()
      local special_paths = {
        vim.fn.stdpath("data") .. "/lazy",
        vim.fn.stdpath("data") .. "/mini.files/trash",
      }
      local paths = {}
      if vim.env.SSH_CLIENT == nil then
        paths = {
          vim.env.HOME .. "/Library/CloudStorage/Dropbox/",
          vim.env.HOME .. "/Desktop/",
        }
      else
        paths = {
          vim.env.HOME .. "/p4/cacl3/test/lib/netapp_ontap/resources/",
          vim.env.HOME .. "/.packages/",
          vim.env.HOME .. "/notes/",
          "/x/eng/rlse/DOT/devN/test/tools/smoke/itc/conf/class_hierarchy.cnf",
          vim.env.HOME .. "/git/ontap/",
        }
      end
      for _, path in ipairs(paths) do
        table.insert(special_paths, path)
      end
      table.sort(special_paths)

      return pick.start({
        source = {
          name = "Special Paths",
          items = special_paths,
          choose = function(item)
            vim.cmd("e " .. item)
          end,
          show = function(buf_id, items, query)
            pick.default_show(buf_id, items, query, { show_icons = true })
          end,
        },
      })
    end, { desc = "Special Paths" })

    -- sessions
    vim.keymap.set("n", "<leader>fs", function()
      pick.builtin.files({}, {
        source = {
          name = "Sessions",
          cwd = require("persisted.config").options.save_dir,
          items = require("persisted").list(),
        },
      })
    end, { desc = "Sessions" })

    -- vim
    vim.keymap.set("n", "<leader>fh", pick.builtin.help, { desc = "Help" })
    vim.keymap.set(
      "n",
      "<leader>fl",
      extra.pickers.hl_groups,
      { desc = "Highlights" }
    )

    -- commands
    vim.keymap.set(
      "n",
      "<leader>fc",
      extra.pickers.commands,
      { desc = "Commands" }
    )
    -- mini builtin registry
    vim.keymap.set("n", "<leader>fC", function()
      local items =
        vim.tbl_keys(vim.tbl_extend("force", pick.registry, extra.pickers))
      table.sort(items)
      local source = {
        items = items,
        name = "Registry",
        choose = function() end,
      }
      local chosen_picker_name = pick.start({ source = source })
      if chosen_picker_name == nil then
        return
      end
      return pick.registry[chosen_picker_name]()
    end, { desc = "Commands (mini.pick)" })

    -- keymaps
    vim.keymap.set("n", "<leader>fk", function()
      extra.pickers.keymaps({ scope = "global" })
    end, { desc = "Keymaps (global)" })
    vim.keymap.set("n", "<leader>fK", function()
      extra.pickers.keymaps({ scope = "buf" })
    end, { desc = "Keymaps (buffer)" })

    -- options
    vim.keymap.set(
      "n",
      "<leader>fo",
      extra.pickers.options,
      { desc = "Options (all)" }
    )
    vim.keymap.set("n", "<leader>fO", function()
      extra.pickers.options({ scope = "buf" })
    end, { desc = "Options (buffer)" })

    -- colorschemes
    vim.keymap.set("n", "<leader>ft", function()
      pick.start({
        source = {
          name = "Colorschemes",
          items = vim.fn.getcompletion("", "color"),
          choose = function(item)
            vim.cmd("colorscheme " .. item)
          end,
          preview = function(buf_id, item)
            vim.cmd("colorscheme " .. item)
          end,
        },
      })
    end, { desc = "Themes" })

    -- misc
    vim.keymap.set(
      "n",
      "<leader>'",
      pick.builtin.resume,
      { desc = "Last Picker" }
    )
    vim.keymap.set(
      "n",
      '<leader>"',
      extra.pickers.registers,
      { desc = "Registers" }
    )
    vim.keymap.set("n", "<leader>:", function()
      extra.pickers.history({ scope = ":" })
    end, { desc = "Command History" })
  end,
}
