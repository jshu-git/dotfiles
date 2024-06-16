return {
	"zbirenbaum/copilot.lua",
	cond = vim.env.SSH_CLIENT ~= nil,
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				auto_refresh = true,
				keymap = {
					open = "<A-CR>",
				},
				layout = {
					ratio = 0.33,
				},
			},
			suggestion = {
				auto_trigger = true,
				hide_during_completion = false,
				debounce = 15,
				keymap = {
					accept = false,
					accept_word = "<A-l>",
					accept_line = false,
					next = "<A-n>",
					prev = "<A-p>",
				},
			},
			filetypes = {
				["*"] = true,
			},
		})

		-- https://github.com/zbirenbaum/copilot.lua/issues/91
		vim.keymap.set("i", "<Tab>", function()
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
			end
		end)
	end,
}
