return {
  "echasnovski/mini.pick",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local pick = require("mini.pick")
    local extra = require("mini.extra")
    vim.ui.select = pick.ui_select

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
        source = {
          name = name .. " (" .. vim.fn.getcwd() .. ")",
        },
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
      { desc = "Files (Recent)" }
    )

    -- grep live
    vim.keymap.set("n", "<leader>fw", function()
      pick.builtin.grep_live({}, get_cwd_opts("Grep Live"))
    end, { desc = "Grep Live" })
    vim.keymap.set("n", "<leader>fW", function()
      pick.builtin.grep_live({}, get_relative_opts("Grep Live"))
    end, { desc = "Grep Live (Relative)" })

    -- grep
    vim.keymap.set("n", "<leader>fg", function()
      local input = vim.fn.input("Grep (cwd): ")
      if input ~= "" then
        local opts = get_cwd_opts("Grep")
        opts.source.name = opts.source.name .. ": " .. input
        pick.builtin.grep({ pattern = input }, opts)
      end
    end, { desc = "Grep" })
    vim.keymap.set("n", "<leader>fG", function()
      local input = vim.fn.input("Grep (Relative): ")
      if input ~= "" then
        local opts = get_relative_opts("Grep")
        opts.source.name = opts.source.name .. ": " .. input
        pick.builtin.grep({ pattern = input }, opts)
      end
    end, { desc = "Grep (Relative)" })

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

    -- special paths
    vim.keymap.set("n", "<leader>fp", function()
      local special_paths = {
        vim.fn.stdpath("data"),
      }
      if vim.env.SSH_CLIENT == nil then
        table.insert(
          special_paths,
          vim.env.HOME .. "/Library/CloudStorage/Dropbox/"
        )
        table.insert(special_paths, vim.env.HOME .. "/Desktop/")
      else
        table.insert(
          special_paths,
          vim.env.HOME .. "/p4/cacl3/test/lib/netapp_ontap/resources/"
        )
        table.insert(special_paths, vim.env.HOME .. "/.packages/")
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

    -- git
    vim.keymap.set(
      "n",
      "<leader>gf",
      extra.pickers.git_files,
      { desc = "Git Files (Tracked)" }
    )
    vim.keymap.set("n", "<leader>gm", function()
      extra.pickers.git_files({ scope = "modified" })
    end, { desc = "Git Files (Modified)" })
    vim.keymap.set(
      "n",
      "<leader>gc",
      extra.pickers.git_commits,
      { desc = "Git Commits" }
    )

    -- sessions
    vim.keymap.set("n", "<leader>fs", function()
      pick.builtin.files({}, {
        source = {
          name = "Sessions (persisted.nvim)",
          cwd = require("persisted.config").options.save_dir,
          items = require("persisted").list(),
        },
      })
    end, { desc = "Sessions" })

    -- mini builtin registry
    vim.keymap.set("n", "<leader>fC", function()
      local items =
        vim.tbl_keys(vim.tbl_extend("force", pick.registry, extra.pickers))
      table.sort(items)
      local source =
        { items = items, name = "Registry", choose = function() end }
      local chosen_picker_name = pick.start({ source = source })
      if chosen_picker_name == nil then
        return
      end
      return pick.registry[chosen_picker_name]()
    end, { desc = "Commands (mini.pick)" })

    -- vim
    vim.keymap.set(
      "n",
      "<leader>fc",
      extra.pickers.commands,
      { desc = "Commands" }
    )
    vim.keymap.set("n", "<leader>fh", pick.builtin.help, { desc = "Help" })
    vim.keymap.set(
      "n",
      "<leader>fl",
      extra.pickers.hl_groups,
      { desc = "Highlights" }
    )
    vim.keymap.set(
      "n",
      "<leader>fk",
      extra.pickers.keymaps,
      { desc = "Keymaps" }
    )
    vim.keymap.set(
      "n",
      "<leader>fo",
      extra.pickers.options,
      { desc = "Options" }
    )
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
