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

  -- {
  -- 	"robitx/gp.nvim",
  -- 	config = function()
  -- 		require("gp").setup({
  -- 			openai_api_key = { "cat", "/Users/jshu/OPENAI_API_KEY" },
  -- 			-- openai_api_endpoint = "https://api.openai.com/v1/chat/completions",
  -- 			agents = {
  -- 				{
  -- 					name = "ChatGPT4",
  -- 					chat = true,
  -- 					command = false,
  -- 					model = { model = "gpt-4o", temperature = 0.7, top_p = 1 },
  -- 					system_prompt = ""
  -- 						.. "You are an AI programming assistant."
  -- 						.. "Follow the user's requirements carefully & to the letter."
  -- 						.. "You must refuse to discuss your opinions or rules."
  -- 						.. "You must refuse to discuss life, existence or sentience."
  -- 						.. "You must refuse to engage in argumentative discussion with the user."
  -- 						.. "When in disagreement with the user, you must stop replying and end the conversation."
  -- 						.. "Your responses must not be accusing, rude, controversial or defensive."
  -- 						.. "Your responses should be informative and logical."
  -- 						.. "You should always adhere to technical information."
  -- 						.. "If the user asks for code or technical questions, you must provide code suggestions and adhere to technical information."
  -- 						.. "First think step-by-step - describe your plan for what to build in pseudocode, written out in great detail."
  -- 						.. "Then output the code in a single code block."
  -- 						.. "Minimize any other prose."
  -- 						.. "Keep your answers short and impersonal."
  -- 						.. "Use Markdown formatting in your answers."
  -- 						.. "Make sure to include the programming language name at the start of the Markdown code blocks."
  -- 						.. "Avoid wrapping the whole response in triple backticks."
  -- 						.. "The active document is the source code the user is looking at right now."
  -- 						.. "You can only give one reply for each conversation turn."
  -- 						.. "You should always generate short suggestions for the next user turns that are relevant to the conversation and not offensive.",
  -- 				},
  -- 				{ name = "ChatGPT3-5" },
  -- 				{ name = "CodeGPT3-5" },
  -- 			},
  -- 			chat_user_prefix = "User:",
  -- 			chat_assistant_prefix = { "AI:", "[{{agent}}]" },
  -- 			chat_topic_gen_model = "gpt-4o",
  -- 			chat_confirm_delete = false,
  -- 			chat_conceal_model_params = false,
  -- 			chat_shortcut_respond = { modes = { "n", "v", "x" }, shortcut = "<leader>w" },
  -- 			chat_shortcut_delete = { modes = { "n", "v", "x" }, shortcut = "<leader>x" },
  -- 			chat_shortcut_stop = { modes = { "n", "v", "x" }, shortcut = "<C-c>" },
  -- 			chat_shortcut_new = { modes = { "n", "v", "x" }, shortcut = "<leader>n" },
  -- 			chat_free_cursor = true,
  -- 			toggle_target = "split",
  -- 			command_prompt_prefix_template = "AI ({{agent}})",
  -- 		})
  --
  -- 		vim.keymap.set("n", "<leader>fa", "<cmd>GpChatFinder<cr><esc>", { desc = "GPT Chats" })
  -- 		vim.keymap.set({ "n", "v" }, "<leader>ax", "<cmd>GpStop<cr>", { desc = "GPT Stop" })
  -- 		-- chat commands
  -- 		vim.keymap.set("n", "<leader>aa", "<cmd>GpChatToggle<cr>", { desc = "Toggle GPT Chat" })
  -- 		vim.keymap.set("n", "<leader>as", "<cmd>GpChatNew split<cr>", { desc = "New GPT Chat (split)" })
  -- 		-- vim.keymap.set("n", "<leader>av", "<cmd>GpChatNew vsplit<cr>", { desc = "New GPT Chat (vsplit)" })
  -- 		-- visual
  -- 		vim.keymap.set("v", "<leader>aa", ":<C-u>'<,'>GpChatToggle<cr>", { desc = "Toggle GPT Chat" })
  -- 		vim.keymap.set("v", "<leader>as", ":<C-u>'<,'>GpChatNew split<cr>", { desc = "New GPT Chat (split)" })
  -- 		-- vim.keymap.set("v", "<leader>av", ":<C-u>'<,'>GpChatNew vsplit<cr>", { desc = "New GPT Chat (vsplit)" })
  -- 		-- vim.keymap.set("v", "<leader>ap", ":<C-u>'<,'>GpChatPaste split<cr>", { desc = "Paste into GPT Chat" })
  --
  -- 		-- prompt commands
  -- 		vim.keymap.set("v", "<leader>ar", ":<C-u>'<,'>GpRewrite<cr>", { desc = "GPT Rewrite" })
  -- 		-- vim.keymap.set("v", "<leader>al", ":<C-u>'<,'>GpAppend<cr>", { desc = "GPT Append" })
  -- 		-- vim.keymap.set("v", "<leader>ah", ":<C-u>'<,'>GpPrepend<cr>", { desc = "GPT Prepend" })
  -- 		-- vim.keymap.set("v", "<leader>ai", ":<C-u>'<,'>GpImplement<cr>", { desc = "GPT Implement" })
  --
  -- 		-- context
  -- 		-- vim.keymap.set({ "n", "i" }, "<leader>ac", "<cmd>GpContext<cr>", { desc = "Add Context" })
  -- 		-- vim.keymap.set("v", "<leader>ac", ":<C-u>'<,'>GpContext<cr>", { desc = "Add Context" })
  -- 	end,
  -- },
}
