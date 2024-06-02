return {
	"echasnovski/mini.pick",
	version = "*",
	dependencies = {
		"echasnovski/mini.extra",
	},
	config = function()
		local pick = require("mini.pick")
		local extra = require("mini.extra")

		-- centered window
		local win_config = function()
			local height = math.floor(0.309 * vim.o.lines)
			local width = math.floor(0.618 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end

		pick.setup({
			mappings = {
				caret_left = "<A-h>",
				caret_right = "<A-l>",
				scroll_down = "<C-d>",
				scroll_up = "<C-u>",
				toggle_info = "<C-k>",
				toggle_preview = "<C-p>",
				move_down = "<Tab>",
				move_up = "<S-Tab>",
			},
			window = {
				config = win_config,
			},
		})

		-- files
		vim.keymap.set("n", "<leader>ff", pick.builtin.files, { desc = "Files" })
		vim.keymap.set("n", "<leader>fw", pick.builtin.grep_live, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>*", "<cmd>Pick grep pattern='<cword>'<cr>", { desc = "Grep (Word)" })

		vim.keymap.set("n", "<leader>/", function()
			extra.pickers.buf_lines({ scope = "current" })
		end, { desc = "Grep Buffer" })
		vim.keymap.set("n", "<leader>fr", extra.pickers.oldfiles, { desc = "Recent Files" })

		-- vim specific
		vim.keymap.set("n", "<leader>fh", pick.builtin.help, { desc = "Help" })
		vim.keymap.set("n", "<leader>fc", extra.pickers.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fH", extra.pickers.hl_groups, { desc = "Highlights" })
		vim.keymap.set("n", "<leader>fk", extra.pickers.keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>fo", extra.pickers.options, { desc = "Options" })
		vim.keymap.set("n", "<leader>f'", extra.pickers.registers, { desc = "Registers" })
		pick.registry.colorschemes = function()
			local colorschemes = vim.fn.getcompletion("", "color")
			return pick.start({
				source = {
					items = colorschemes,
					choose = function(item)
						vim.cmd("colorscheme " .. item)
					end,
				},
			})
		end
		vim.keymap.set("n", "<leader>ft", pick.registry.colorschemes, { desc = "Themes" })

		-- misc
		vim.keymap.set("n", "<leader>;", function()
			extra.pickers.history({ scope = ":" })
		end, { desc = "Command History" })
		vim.keymap.set("n", "<leader>'", pick.builtin.resume, { desc = "Last Picker" })

		-- highlights
		vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickBorder" })
		vim.api.nvim_set_hl(0, "MiniPickBorderText", { link = "MiniPickBorder" })
	end,
}
