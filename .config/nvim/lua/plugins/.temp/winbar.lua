return {
	-- {
	-- 	"b0o/incline.nvim",
	-- 	dependences = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("incline").setup({
	-- 			-- render = function(props)
	-- 			-- 	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
	-- 			-- 	if filename == "" then
	-- 			-- 		filename = "[No Name]"
	-- 			-- 	end
	-- 			-- 	local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
	-- Search = "None",
	-- 			--
	-- 			-- 	return {
	-- 			-- 		ft_icon and {
	-- 			-- 			" ",
	-- 			-- 			ft_icon,
	-- 			-- 			"  ",
	-- 			-- 			guibg = ft_color,
	-- 			-- 			guifg = require("incline.helpers").contrast_color(ft_color),
	-- 			-- 		} or " ",
	-- 			-- 		" ",
	-- 			-- 		{ filename },
	-- 			-- 	}
	-- 			-- end,
	-- 			window = {
	-- 				winhighlight = {
	-- 					inactive = {
	-- 						Normal = "NonText",
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	"ramilito/winbar.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("winbar").setup({
			icons = true,
			diagnostics = false,
			buf_modified = true,
			buf_modified_symbol = "●",
			dim_inactive = {
				enabled = true,
				highlight = "NonText",
				icons = true,
				name = true,
			},
		})
	end,
}
