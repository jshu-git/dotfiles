return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		local mini = require("mini.files")
		mini.setup({
			mappings = {
				go_in = "",
				go_in_plus = "l",
				go_out = "",
				go_out_plus = "h",
				show_help = "?",
			},
			options = {
				permanent_delete = false,
			},
			windows = {
				width_focus = 20,
				width_nofocus = 20,
			},
		})

		-- toggle explorer
		vim.keymap.set("n", "<leader>e", function()
			if not mini.close() then
				mini.open(vim.api.nvim_buf_get_name(0))
			end
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
			MiniFiles.refresh({ content = { filter = new_filter } })
		end
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
			end,
		})
	end,
}
