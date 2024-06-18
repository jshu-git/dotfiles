return {
	"echasnovski/mini.pick",
	dependencies = {
		"echasnovski/mini.extra",
	},
	config = function()
		local pick = require("mini.pick")
		local extra = require("mini.extra")
		vim.ui.select = pick.ui_select

		-- centered window
		local win_config = function()
			local height = math.floor(0.5 * vim.o.lines)
			local width = math.floor(0.75 * vim.o.columns)
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
				choose_marked = "<C-q>",
				delete_left = "", -- defaults to <C-u>
				mark_all = "<C-S-X>", -- defaults to <C-a>
				scroll_down = "<C-d>",
				scroll_up = "<C-u>",
			},
			window = {
				config = win_config,
				prompt_prefix = " ",
			},
		})

		-- files
		vim.keymap.set("n", "<leader>ff", pick.builtin.files, { desc = "Files (cwd)" })
		pick.registry.files_relative = function(local_opts)
			local relative_path = vim.fn.expand("%:p:h")
			local opts = {
				source = {
					name = "Files (Relative): " .. relative_path,
					cwd = relative_path,
					items = vim.fn.readdir(relative_path),
				},
			}
			return pick.builtin.files(local_opts, opts)
		end
		vim.keymap.set("n", "<leader>fF", pick.registry.files_relative, { desc = "Files (Relative)" })
		vim.keymap.set("n", "<leader>fr", extra.pickers.oldfiles, { desc = "Files (Recent)" })

		-- grep
		vim.keymap.set("n", "<leader>fw", pick.builtin.grep_live, { desc = "Grep (Live)" })
		vim.keymap.set("n", "<leader>*", function()
			pick.builtin.grep(
				{ pattern = vim.fn.expand("<cword>") },
				{ source = { name = "Grep (cword): " .. vim.fn.expand("<cword>") } }
			)
		end, { desc = "Grep (cword)" })
		vim.keymap.set("n", "<leader>/", function()
			extra.pickers.buf_lines({ scope = "current" })
		end, { desc = "Grep (Buffer)" })

		-- special paths
		pick.registry.special_paths = function()
			local special_paths = {
				vim.fn.stdpath("data"),
				vim.env.HOME .. "/Library/CloudStorage/Dropbox/",
				vim.env.HOME .. "/Desktop/",
			}
			table.sort(special_paths)
			return pick.start({
				source = {
					name = "Special Paths (mini.files)",
					items = special_paths,
					choose = function(item)
						vim.cmd("e " .. item)
					end,
					show = function(buf_id, items, query)
						pick.default_show(buf_id, items, query, { show_icons = true })
					end,
				},
			})
		end
		vim.keymap.set("n", "<leader>fp", pick.registry.special_paths, { desc = "Special Paths (mini.files)" })

		-- git
		vim.keymap.set("n", "<leader>gf", extra.pickers.git_files, { desc = "Git Files (Tracked)" })
		vim.keymap.set("n", "<leader>gm", function()
			extra.pickers.git_files({ scope = "modified" })
		end, { desc = "Git Files (Modified)" })
		vim.keymap.set("n", "<leader>gc", extra.pickers.git_commits, { desc = "Git Commits" })

		-- vim
		vim.keymap.set("n", "<leader>fc", extra.pickers.commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fh", pick.builtin.help, { desc = "Help" })
		vim.keymap.set("n", "<leader>fl", extra.pickers.hl_groups, { desc = "Highlights" })
		vim.keymap.set("n", "<leader>fk", extra.pickers.keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>fo", extra.pickers.options, { desc = "Options" })
		pick.registry.colorschemes = function()
			return pick.start({
				source = {
					name = "Colorschemes",
					items = vim.fn.getcompletion("", "color"),
					choose = function(item)
						vim.cmd("colorscheme " .. item)
					end,
					preview = function(buf_id, item)
						vim.cmd("colorscheme " .. item)
					end,
				},
			})
		end
		vim.keymap.set("n", "<leader>ft", pick.registry.colorschemes, { desc = "Themes" })

		pick.registry.builtin = function()
			local items = vim.tbl_keys(vim.tbl_extend("force", pick.registry, extra.pickers))
			for i, item in ipairs(items) do
				if item == "registry" then
					table.remove(items, i)
					break
				end
			end
			table.sort(items)
			local source = { items = items, name = "Registry", choose = function() end }
			local chosen_picker_name = pick.start({ source = source })
			if chosen_picker_name == nil then
				return
			end
			return pick.registry[chosen_picker_name]()
		end
		vim.keymap.set("n", "<leader>fC", pick.registry.builtin, { desc = "Commands (mini.pick)" })

		-- misc
		vim.keymap.set("n", "<leader>'", pick.builtin.resume, { desc = "Last Picker" })
		vim.keymap.set("n", '<leader>"', extra.pickers.registers, { desc = "Registers" })
		vim.keymap.set("n", "<leader>:", function()
			extra.pickers.history({ scope = ":" })
		end, { desc = "Command History" })
	end,
}
