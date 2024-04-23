return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"rmagatti/auto-session",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				scroll_strategy = "limit",
				layout_strategy = "center",
				layout_config = {
					center = {
						height = 0.5,
						-- preview_cutoff = 10,
						width = 0.8,
						-- prompt_position = "top",
					},
				},
				dynamic_preview_title = true,
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<Down>"] = actions.cycle_history_next,
						["<Up>"] = actions.cycle_history_prev,
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
						[","] = actions.toggle_selection,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown(),
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("session-lens")

		-- files
		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Grep Current Buffer" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Grep" })
		vim.keymap.set("n", "<leader>fW", function()
			builtin.live_grep({ grep_open_files = true })
		end, { desc = "Grep Open Files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
		vim.keymap.set("n", "<leader>fQ", builtin.quickfixhistory, { desc = "Quickfix History" })

		-- helpers
		vim.keymap.set("n", "<leader>'", builtin.resume, { desc = "Last Picker" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fC", builtin.builtin, { desc = "Telescope Commands" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>ft", function()
			builtin.colorscheme({ enable_preview = true })
		end, { desc = "Themes" })
		vim.keymap.set("n", "<leader>fo", builtin.vim_options, { desc = "Vim Options" })
	end,
}