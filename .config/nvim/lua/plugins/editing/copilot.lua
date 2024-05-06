return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
				-- auto_refresh = true,
				-- layout = {
				-- 	position = "right",
				-- 	ratio = 0.4,
				-- },
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
				},
			},
			filetypes = {
				yaml = true,
				markdown = true,
				gitcommit = true,
				["."] = true,
			},
		})
	end,
}
