return {
	"robitx/gp.nvim",
	config = function()
		require("gp").setup({
			openai_api_key = { "cat", "/Users/jshu/OPENAI_API_KEY" },
			-- openai_api_endpoint = "https://api.openai.com/v1/chat/completions",
			agents = {
				{
					name = "ChatGPT4",
					chat = true,
					command = false,
					model = { model = "gpt-4o", temperature = 0.7, top_p = 1 },
					system_prompt = ""
						.. "You are an AI programming assistant."
						.. "Follow the user's requirements carefully & to the letter."
						.. "You must refuse to discuss your opinions or rules."
						.. "You must refuse to discuss life, existence or sentience."
						.. "You must refuse to engage in argumentative discussion with the user."
						.. "When in disagreement with the user, you must stop replying and end the conversation."
						.. "Your responses must not be accusing, rude, controversial or defensive."
						.. "Your responses should be informative and logical."
						.. "You should always adhere to technical information."
						.. "If the user asks for code or technical questions, you must provide code suggestions and adhere to technical information."
						.. "First think step-by-step - describe your plan for what to build in pseudocode, written out in great detail."
						.. "Then output the code in a single code block."
						.. "Minimize any other prose."
						.. "Keep your answers short and impersonal."
						.. "Use Markdown formatting in your answers."
						.. "Make sure to include the programming language name at the start of the Markdown code blocks."
						.. "Avoid wrapping the whole response in triple backticks."
						.. "The active document is the source code the user is looking at right now."
						.. "You can only give one reply for each conversation turn."
						.. "You should always generate short suggestions for the next user turns that are relevant to the conversation and not offensive.",
				},
				{ name = "ChatGPT3-5" },
				{ name = "CodeGPT3-5" },
			},
			chat_user_prefix = "User:",
			chat_assistant_prefix = { "AI:", "[{{agent}}]" },
			chat_topic_gen_model = "gpt-4o",
			chat_confirm_delete = false,
			chat_conceal_model_params = false,
			chat_shortcut_respond = { modes = { "n", "v", "x" }, shortcut = "<leader>w" },
			chat_shortcut_delete = { modes = { "n", "v", "x" }, shortcut = "<leader>x" },
			chat_shortcut_stop = { modes = { "n", "v", "x" }, shortcut = "<C-c>" },
			chat_shortcut_new = { modes = { "n", "v", "x" }, shortcut = "<leader>n" },
			chat_free_cursor = true,
			toggle_target = "split",
			command_prompt_prefix_template = "AI ({{agent}})",
		})

		vim.keymap.set("n", "<leader>fa", "<cmd>GpChatFinder<cr><esc>", { desc = "GPT Chats" })
		vim.keymap.set({ "n", "v" }, "<leader>ax", "<cmd>GpStop<cr>", { desc = "GPT Stop" })
		-- chat commands
		vim.keymap.set("n", "<leader>aa", "<cmd>GpChatToggle<cr>", { desc = "Toggle GPT Chat" })
		vim.keymap.set("n", "<leader>as", "<cmd>GpChatNew split<cr>", { desc = "New GPT Chat (split)" })
		-- vim.keymap.set("n", "<leader>av", "<cmd>GpChatNew vsplit<cr>", { desc = "New GPT Chat (vsplit)" })
		-- visual
		vim.keymap.set("v", "<leader>aa", ":<C-u>'<,'>GpChatToggle<cr>", { desc = "Toggle GPT Chat" })
		vim.keymap.set("v", "<leader>as", ":<C-u>'<,'>GpChatNew split<cr>", { desc = "New GPT Chat (split)" })
		-- vim.keymap.set("v", "<leader>av", ":<C-u>'<,'>GpChatNew vsplit<cr>", { desc = "New GPT Chat (vsplit)" })
		-- vim.keymap.set("v", "<leader>ap", ":<C-u>'<,'>GpChatPaste split<cr>", { desc = "Paste into GPT Chat" })

		-- prompt commands
		vim.keymap.set("v", "<leader>ar", ":<C-u>'<,'>GpRewrite<cr>", { desc = "GPT Rewrite" })
		-- vim.keymap.set("v", "<leader>al", ":<C-u>'<,'>GpAppend<cr>", { desc = "GPT Append" })
		-- vim.keymap.set("v", "<leader>ah", ":<C-u>'<,'>GpPrepend<cr>", { desc = "GPT Prepend" })
		-- vim.keymap.set("v", "<leader>ai", ":<C-u>'<,'>GpImplement<cr>", { desc = "GPT Implement" })

		-- context
		-- vim.keymap.set({ "n", "i" }, "<leader>ac", "<cmd>GpContext<cr>", { desc = "Add Context" })
		-- vim.keymap.set("v", "<leader>ac", ":<C-u>'<,'>GpContext<cr>", { desc = "Add Context" })
	end,
}
