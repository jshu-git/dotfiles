return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local fzf = require("fzf-lua")

		-- centered window
		local height = math.floor(0.75 * vim.o.lines)
		local width = math.floor(0.75 * vim.o.columns)

		fzf.setup({
			winopts = {
				height = height,
				width = width,
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
				border = "single",
			},
			preview = {
				default = "bat",
				layout = "horizontal",
			},
		})

		-- files
		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Files" })
		vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent Files" })

		-- grep
		vim.keymap.set("n", "<leader>/", fzf.blines, { desc = "Grep (Buffer)" })
		vim.keymap.set("n", "<leader>fw", fzf.live_grep_native, { desc = "Grep (Live)" })
		vim.keymap.set("n", "<leader>fW", fzf.grep, { desc = "Grep" })
		vim.keymap.set("n", "<leader>*", fzf.grep_cword, { desc = "Grep (cword)" })
		-- visual
		vim.keymap.set("v", "<leader>fw", fzf.grep_visual, { desc = "Grep (Visual)" })

		-- vim
		vim.keymap.set("n", "<leader>fc", fzf.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fC", fzf.builtin, { desc = "Commands (fzf-lua)" })
		vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Help" })
		vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>fl", fzf.highlights, { desc = "Highlights" })
		vim.keymap.set("n", "<leader>ft", fzf.colorschemes, { desc = "Colorschemes" })

		-- misc
		vim.keymap.set("n", '<leader>"', fzf.registers, { desc = "Registers" })
		vim.keymap.set("n", "<leader>'", fzf.resume, { desc = "Resume Picker" })
		vim.keymap.set("n", "<leader>:", fzf.command_history, { desc = "Command History" })
		vim.keymap.set("n", "<leader>=", fzf.spell_suggest, { desc = "Spell Suggest" })

		-- -- vim
		-- vim.keymap.set("n", "<leader>fo", extra.pickers.options, { desc = "Options" })
		-- -- vim.keymap.set("n", '"', extra.pickers.registers, { desc = "Registers" })
		-- -- misc
		-- vim.keymap.set("n", "<leader>=", extra.pickers.spellsuggest, { desc = "Spell Suggest (cword)" })
	end,
}
