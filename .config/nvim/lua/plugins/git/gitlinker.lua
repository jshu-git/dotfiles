return {
	"ruifm/gitlinker.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local gitlinker = require("gitlinker")
		local actions = require("gitlinker.actions")

		require("gitlinker").setup({
			mappings = nil,
			callbacks = {
				["bitbucket.ngage.netapp.com"] = function(url_data)
					-- https://bitbucket.ngage.netapp.com/scm/op/api
					local url = require("gitlinker.hosts").get_base_https_url(url_data)

					-- https://bitbucket.ngage.netapp.com/projects/op/api
					url = url:gsub("/scm/", "/projects/")

					-- https://bitbucket.ngage.netapp.com/projects/op/repos/api
					local parts = vim.split(url, "/")
					table.insert(parts, #parts, "repos")
					url = table.concat(parts, "/")

					-- https://bitbucket.ngage.netapp.com/projects/repos/op/api/ .. /browse/ .. ontap/api/__init__.py
					url = url .. "/browse/" .. url_data.file

					-- line numbers
					if url_data.lstart then
						url = url .. "#" .. url_data.lstart
					end
					if url_data.lend then
						url = url .. "-" .. url_data.lend
					end
					return url
				end,
			},
		})
		-- copy url
		vim.keymap.set("n", "<leader>gy", function()
			gitlinker.get_buf_range_url("n", { action_callback = actions.copy_to_clipboard })
		end, { desc = "Copy Git URL" })
		vim.keymap.set("v", "<leader>gy", function()
			gitlinker.get_buf_range_url("v", { action_callback = actions.copy_to_clipboard })
		end, { desc = "Copy Git URL" })

		-- open in browser
		vim.keymap.set("n", "<leader>gx", function()
			gitlinker.get_buf_range_url("n", { action_callback = actions.open_in_browser })
		end, { desc = "Open Git URL", silent = true })
		vim.keymap.set("v", "<leader>gx", function()
			gitlinker.get_buf_range_url("v", { action_callback = actions.open_in_browser })
		end, { desc = "Open Git URL", silent = true })
	end,

	-- {
	-- 	"echasnovski/mini.diff",
	-- 	config = function()
	-- 		local diff = require("mini.diff")
	-- 		diff.setup({
	-- 			view = {
	-- 				style = "sign",
	-- 				signs = { add = "+", change = "~", delete = "-" },
	-- 			},
	-- 			mappings = {
	-- 				apply = "<leader>gh",
	-- 				reset = "<leader>gH",
	-- 				textobject = "ih",
	-- 				goto_first = "[H",
	-- 				goto_prev = "[h",
	-- 				goto_next = "]h",
	-- 				goto_last = "]H",
	-- 			},
	-- 		})
	-- 		vim.keymap.set("n", "<leader>gt", diff.toggle_overlay, { desc = "Toggle Overlay" })
	-- 	end,
	-- },
}
