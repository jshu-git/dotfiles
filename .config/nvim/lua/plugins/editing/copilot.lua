require("copilot").setup({
	panel = { enabled = false },
	suggestion = {
		auto_trigger = true,
		hide_during_completion = false,
		debounce = 0,
		keymap = {
			accept = false,
			accept_word = "<A-l>",
			next = "<A-n>",
			prev = "<A-p>",
		},
	},
	filetypes = {
		["*"] = true,
		["rip-substitute"] = false,
		["snacks_picker_input"] = false,
	},
})

local suggestion = require("copilot.suggestion")
-- https://github.com/zbirenbaum/copilot.lua/issues/91
vim.keymap.set("i", "<Tab>", function()
	if suggestion.is_visible() then
		suggestion.accept()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end)
