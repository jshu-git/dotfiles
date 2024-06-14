return {
	"echasnovski/mini.files",
	config = function()
		local files = require("mini.files")
		files.setup({
			mappings = {
				close = "<esc>",
				go_in = "",
				go_in_plus = "<CR>",
				go_out = "",
				go_out_plus = "-",
				reset = "_",
				show_help = "?",
				synchronize = "<leader>w",
			},
			options = {
				permanent_delete = false,
			},
			windows = {
				width_focus = math.floor(0.15 * vim.o.columns),
				width_nofocus = math.floor(0.15 * vim.o.columns),
				width_preview = math.floor(0.33 * vim.o.columns),
			},
		})

		-- toggle explorer
		vim.keymap.set("n", "<leader>e", function()
			if not files.close() then
				files.open(vim.api.nvim_buf_get_name(0))
				files.reveal_cwd()
			end
		end, { desc = "Explorer" })
		-- vim.keymap.set("n", "<leader>E", function()
		-- 	files.open(nil, false)
		-- end, { desc = "Explorer (cwd)" })

		-- toggle preview
		local show_preview = false
		local toggle_preview = function()
			show_preview = not show_preview
			files.refresh({ windows = { preview = show_preview } })
		end
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				vim.keymap.set("n", "<Tab>", toggle_preview, {
					buffer = buf_id,
					desc = "Toggle Preview",
				})
			end,
		})

		-- open in split
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				vim.api.nvim_win_call(files.get_target_window(), function()
					vim.cmd(direction .. " split")
					new_target_window = vim.api.nvim_get_current_win()
				end)
				files.set_target_window(new_target_window)
				files.go_in({ close_on_file = true })
			end
			-- Adding `desc` will result into `show_help` entries
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

		-- customize window
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesWindowOpen",
			callback = function(args)
				local win_id = args.data.win_id
				local config = vim.api.nvim_win_get_config(win_id)
				config.title_pos = "center"
				vim.api.nvim_win_set_config(win_id, config)
			end,
		})
	end,
}
