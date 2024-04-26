return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- custom mappings
		local function custom_mappings(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			-- tree
			vim.keymap.set("n", "=", api.tree.change_root_to_node, opts("CD"))
			vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "e", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "c", api.tree.collapse_all, opts("Collapse"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "gr", api.tree.reload, opts("Refresh"))
			-- toggles
			vim.keymap.set("n", "tb", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
			vim.keymap.set("n", "tg", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
			vim.keymap.set("n", "th", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
			vim.keymap.set("n", "ti", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
			-- vim.keymap.set("n", "tm", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
			-- vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
			vim.keymap.set("n", "/", api.tree.search_node, opts("Search"))
			-- vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
			vim.keymap.set("n", "<esc>", api.tree.close, opts("Close"))

			-- navigation
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			-- vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
			vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
			vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
			vim.keymap.set("n", "gh", api.node.show_info_popup, opts("Info"))
			-- vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
			-- vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
			-- vim.keymap.set("n", "]d", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
			-- vim.keymap.set("n", "[d", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
			-- vim.keymap.set('n', 'gg',      api.node.navigate.parent,            opts('Parent Directory'))
			-- vim.keymap.set('n', '>',       api.node.navigate.sibling.next,      opts('Next Sibling'))
			-- vim.keymap.set('n', '<',       api.node.navigate.sibling.prev,      opts('Previous Sibling'))
			-- vim.keymap.set('n', '<C-t>',   api.node.open.tab,                   opts('Open: New Tab'))
			-- vim.keymap.set('n', '.',       api.node.run.cmd,                    opts('Run Command'))
			-- vim.keymap.set('n', 's',       api.node.run.system,                 opts('Run System'))

			-- file operations
			vim.keymap.set("n", "a", api.fs.create, opts("Create File Or Directory"))
			vim.keymap.set("n", "r", api.fs.rename_full, opts("Rename: Full Path"))
			vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
			vim.keymap.set("n", "x", api.fs.trash, opts("Trash"))
			vim.keymap.set("n", "dd", api.fs.cut, opts("Cut"))
			vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
			vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
			vim.keymap.set("n", "gY", api.fs.copy.relative_path, opts("Copy Relative Path"))

			-- marks
			vim.keymap.set("n", "X", api.marks.bulk.trash, opts("Trash Bookmarked"))
			vim.keymap.set("n", "M", api.marks.bulk.move, opts("Move Bookmarked"))
			vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))

			-- filters
			vim.keymap.set("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
			vim.keymap.set("n", "f", api.live_filter.start, opts("Live Filter: Start"))
		end

		local HEIGHT_RATIO = 0.8
		local WIDTH_RATIO = 0.5

		require("nvim-tree").setup({
			on_attach = custom_mappings,
			hijack_cursor = true,
			view = {
				centralize_selection = true,
				cursorline = false,
				side = "right",
				width = 25,
			},
			renderer = {
				add_trailing = true,
				highlight_git = "icon",
				highlight_diagnostics = "icon",
				highlight_opened_files = "name",
				highlight_modified = "icon",
				indent_markers = {
					enable = true,
				},
				icons = {
					web_devicons = {
						folder = {
							enable = true,
						},
					},
					show = {
						folder_arrow = false,
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
			},
			modified = {
				enable = true,
				show_on_dirs = false,
			},
			actions = {
				expand_all = {
					max_folder_discovery = 3,
					exclude = { ".git", ".github", ".cache" },
				},
			},
		})
		-- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Explorer" })
		vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFileToggle!<CR>", { desc = "NvimTree" })
	end,
}
