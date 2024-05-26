return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				json = { "prettier" },
				markdown = { "prettier" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					quiet = false,
					timeout_ms = 500,
				}
			end,
		})

		-- toggle autoformatting
		vim.g.disable_autoformat = false
		vim.api.nvim_create_user_command("ToggleAutoformatting", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
		end, {
			desc = "Toggle Autoformatting",
		})
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleAutoformatting<CR>", { desc = "Toggle Autoformatting" })
	end,
}
