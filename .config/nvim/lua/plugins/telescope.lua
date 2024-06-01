return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		-- extensions
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")
		local themes = require("telescope.themes")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				scroll_strategy = "limit",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						height = 0.5,
						prompt_position = "top",
					},
				},
				dynamic_preview_title = true,
				results_title = false,
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<Down>"] = actions.cycle_history_next,
						["<Up>"] = actions.cycle_history_prev,
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
						["<C-s>"] = actions.select_horizontal,
						["<C-p>"] = layout.toggle_preview,
					},
				},
				file_ignore_patterns = { "lazy%-lock.json" },
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown(),
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		-- files
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
		vim.keymap.set("n", "<leader>fF", function()
			builtin.find_files({ hidden = true })
		end, { desc = "Files (Hidden)" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Grep" })
		vim.keymap.set("n", "<leader>fW", function()
			builtin.live_grep({
				additional_args = { "--hidden" },
			})
		end, { desc = "Grep (Hidden)" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })

		-- buffer
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({ skip_empty_lines = true }))
		end, { desc = "Grep (Current Buffer)" })

		-- lsp
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })

		-- vim specific
		vim.keymap.set("n", "<leader>ft", function()
			builtin.colorscheme({ enable_preview = true, previewer = false })
		end, { desc = "Themes" })
		vim.keymap.set("n", "<leader>fH", builtin.highlights, { desc = "Highlights" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
		vim.keymap.set("n", "<leader>fo", builtin.vim_options, { desc = "Vim Options" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fC", builtin.builtin, { desc = "Telescope Commands" })

		-- misc
		vim.keymap.set("n", "<leader>'", builtin.resume, { desc = "Last Picker" })
	end,
}
