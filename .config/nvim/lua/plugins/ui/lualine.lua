return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
	config = function()
		local function total_lines()
			return vim.api.nvim_buf_line_count(0) .. "L"
		end
		local function file_size()
			return string.format("%.2f", vim.fn.getfsize(vim.fn.expand("%:p")) / 1024) .. "KB"
		end
		local function luapad()
			if require("luapad.statusline").status() == "ok" then
				return "󰆒 Luapad"
			else
				return ""
			end
		end

		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha" },
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {
					{ "branch" },
					{ "diff" },
					{ "diagnostics" },
				},
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					{ luapad },
					{
						"copilot",
						symbols = {
							status = {
								icons = {
									enabled = "",
									sleep = "",
									disabled = "",
									warning = "",
									unknown = "",
								},
							},
							show_colors = true,
						},
					},
					{ file_size },
				},
				lualine_y = {
					{ "filetype" },
				},
				lualine_z = {
					{ total_lines },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 0 } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
