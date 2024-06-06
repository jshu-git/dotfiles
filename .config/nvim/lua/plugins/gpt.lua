return {
	"robitx/gp.nvim",
	config = function()
		require("gp").setup({
			-- openai_api_key = "",
			-- openai_api_endpoint = "",
			agents = {
				{ name = "ChatGPT3-5" },
				{ name = "CodeGPT3-5" },
			},
			chat_user_prefix = "User:",
			chat_assistant_prefix = { "AI:", "[{{agent}}]" },
			chat_confirm_delete = false,
			chat_conceal_model_params = false,
			chat_shortcut_respond = { modes = { "n", "v", "x" }, shortcut = "<leader>w" },
			chat_shortcut_delete = { modes = { "n", "v", "x" }, shortcut = "<leader>X" },
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
		vim.keymap.set("n", "<leader>as", "<cmd>GpChatNew split<cr>", { desc = "New GPT Chat" })
		-- visual
		vim.keymap.set("v", "<leader>aa", ":<C-u>'<,'>GpChatToggle<cr>", { desc = "Toggle GPT Chat" })
		vim.keymap.set("v", "<leader>as", ":<C-u>'<,'>GpChatNew split<cr>", { desc = "New GPT Chat" })
		vim.keymap.set("v", "<leader>ap", ":<C-u>'<,'>GpChatPaste split<cr>", { desc = "Paste into GPT Chat" })

		-- prompt commands
		vim.keymap.set("v", "<leader>ar", ":<C-u>'<,'>GpRewrite<cr>", { desc = "GPT Rewrite" })
		vim.keymap.set("v", "<leader>al", ":<C-u>'<,'>GpAppend<cr>", { desc = "GPT Append" })
		vim.keymap.set("v", "<leader>ah", ":<C-u>'<,'>GpPrepend<cr>", { desc = "GPT Prepend" })
		vim.keymap.set("v", "<leader>ai", ":<C-u>'<,'>GpImplement<cr>", { desc = "GPT Implement" })

		-- context
		-- vim.keymap.set({ "n", "i" }, "<leader>ac", "<cmd>GpContext<cr>", { desc = "Add Context" })
		-- vim.keymap.set("v", "<leader>ac", ":<C-u>'<,'>GpContext<cr>", { desc = "Add Context" })
	end,
}
