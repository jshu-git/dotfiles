return {
	-- "stefandtw/quickfix-reflector.vim",
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	config = function()
		local bqf = require("bqf")
		bqf.setup({
			auto_resize_height = true,
			preview = {
				auto_preview = false,
				border = "single",
				show_scroll_bar = false,
				winblend = 10,
			},
			func_map = {
				split = "<C-s>",
			},
		})

		-- vim.keymap.set("n", "<leader>c", function()
		-- 	for _, info in ipairs(vim.fn.getwininfo()) do
		-- 		if info.quickfix == 1 then
		-- 			vim.cmd("cclose")
		-- 			return
		-- 		end
		-- 	end
		-- 	if next(vim.fn.getqflist()) == nil then
		-- 		vim.notify("Quickfix list is empty")
		-- 		return
		-- 	end
		-- 	vim.cmd("copen")
		-- end, { desc = "Quickfix (Toggle)" })

		vim.keymap.set("n", "<leader>c", function()
			local quickfix_winid = vim.fn.getqflist({ winid = 0 }).winid
			if quickfix_winid > 0 then
				vim.cmd("cclose")
				return
			end
			if next(vim.fn.getqflist()) == nil then
				vim.notify("Quickfix list is empty")
				return
			end
			vim.cmd("copen")
		end, { desc = "Quickfix (Toggle)" })
	end,
}
