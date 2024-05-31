return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		local mini = require("mini.files")
		mini.setup({
			mappings = {
				close = "<esc>",
				go_in = "L",
				go_in_plus = "l",
				reset = "_",
				show_help = "?",
				synchronize = "<leader>w",
			},
			options = {
				permanent_delete = false,
			},
			windows = {
				width_focus = 25,
				width_nofocus = 25,
				width_preview = 50,
			},
		})

		vim.keymap.set("n", "<leader>e", function()
			mini.open(vim.api.nvim_buf_get_name(0), true)
		end, { desc = "Explorer" })
		vim.keymap.set("n", "<leader>E", function()
			mini.open(nil, false)
		end, { desc = "Explorer (cwd)" })

		-- toggle dotfiles
		local show_dotfiles = true
		local filter_show = function(fs_entry)
			return true
		end
		local filter_hide = function(fs_entry)
			return not vim.startswith(fs_entry.name, ".")
		end
		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			local new_filter = show_dotfiles and filter_show or filter_hide
			mini.refresh({ content = { filter = new_filter } })
		end
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				vim.keymap.set("n", "th", toggle_dotfiles, { buffer = buf_id, desc = "Toggle Hidden Files" })
			end,
		})

		-- toggle preview
		local show_preview = false
		local toggle_preview = function()
			show_preview = not show_preview
			mini.refresh({ windows = { preview = show_preview } })
		end
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				vim.keymap.set("n", "<Tab>", toggle_preview, { buffer = buf_id, desc = "Toggle Preview" })
			end,
		})

		-- open in split
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				local new_target_window
				vim.api.nvim_win_call(mini.get_target_window(), function()
					vim.cmd(direction .. " split")
					new_target_window = vim.api.nvim_get_current_win()
				end)
				mini.set_target_window(new_target_window)
				mini.close()
			end
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				map_split(buf_id, "<C-s>", "belowright horizontal")
				map_split(buf_id, "<C-v>", "belowright vertical")
			end,
		})
	end,
}
