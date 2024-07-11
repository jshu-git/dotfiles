return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local chat = require("CopilotChat")
    local select = require("CopilotChat.select")
    -- enables '/' cmp in chat window
    require("CopilotChat.integrations.cmp").setup()

    chat.setup({
      separator = " ",
      show_folds = false,
      show_help = false,
      selection = function(source)
        return select.visual(source) or select.buffer(source)
      end,
      window = {
        layout = "float",
        width = 0.9,
        height = 0.9,
      },
      mappings = {
        complete = {
          insert = "",
        },
        close = {
          normal = "<esc>",
          insert = "",
        },
        reset = {
          normal = "gr",
          insert = "",
        },
        submit_prompt = {
          normal = "<leader>w",
          insert = "",
        },
      },
    })
    -- custom mappings
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-*",
      callback = function()
        vim.keymap.set("n", "<C-c>", chat.stop, { buffer = true })
      end,
    })

    vim.keymap.set(
      { "n", "x" },
      "<leader>aa",
      chat.toggle,
      { desc = "Toggle CopilotChat" }
    )

    -- save and load chats
    -- vim.keymap.set("n", "<leader>aw", function()
    -- 	local input = vim.fn.input("Save CopilotChat ('default' if empty): ")
    -- 	if input ~= "" then
    -- 		chat.save(input)
    -- 		vim.notify("Saved CopilotChat: " .. input)
    -- 	else
    -- 		chat.save()
    -- 		vim.notify("CopilotChat: No input. Saving to 'default'", vim.log.levels.WARN)
    -- 	end
    -- end, { desc = "Save Chat" })
    -- local history_path = chat.config.history_path
    -- vim.keymap.set("n", "<leader>ah", function()
    -- 	require("mini.pick").start({
    -- 		source = {
    -- 			cwd = history_path,
    -- 			items = vim.fn.readdir(history_path),
    -- 			name = "CopilotChat History",
    -- 			choose = function(item)
    -- 				-- remove file extension
    -- 				local name = vim.fn.fnamemodify(item, ":r")
    -- 				chat.load(vim.fs.basename(name))
    -- 				-- HACK: for some reason load() doesn't focus the chat window, so toggle twice with sleep
    -- 				chat.toggle()
    -- 				vim.defer_fn(function()
    -- 					chat.toggle()
    -- 				end, 100)
    -- 			end,
    -- 		},
    -- 	})
    -- end, { desc = "CopilotChat History" })
    -- vim.keymap.set("n", "<leader>ae", function()
    -- 	require("mini.files").open(history_path)
    -- end, { desc = "History (Explorer)" })

    -- vim.keymap.set("n", "<leader>ar", function()
    -- 	local input = vim.fn.input("Load CopilotChat ('default' if empty): ")
    -- 	if input ~= "" then
    -- 		chat.load(input)
    -- 		vim.notify("Loaded CopilotChat: " .. input)
    -- 	else
    -- 		chat.load()
    -- 		vim.notify("Loaded CopilotChat: default")
    -- 	end
    -- end, { desc = "CopilotChat (Load)" })
  end,
}
