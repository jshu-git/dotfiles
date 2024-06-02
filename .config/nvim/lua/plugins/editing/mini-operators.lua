return {
	"echasnovski/mini.operators",
	config = function()
		local operators = require("mini.operators")
		operators.setup({
			evaluate = {
				prefix = "se",
			},
			exchange = {
				prefix = "sx",
			},
			multiply = {
				prefix = "sm",
			},
			sort = {
				prefix = "so",
			},
		})
		operators.make_mappings("replace", {
			textobject = "s",
			line = "ss",
			selection = "ss",
		})
	end,
}

-- return {
-- "gbprod/substitute.nvim",
-- config = function()
-- 	local substitute = require("substitute")
-- 	substitute.setup({
-- 		highlight_substituted_text = {
-- 			timer = 150,
-- 		},
-- 	})
--
-- 	-- substitute
-- 	vim.keymap.set("n", "s", substitute.operator, { noremap = true, desc = "Substitute Operator" })
-- 	vim.keymap.set("n", "ss", substitute.line, { noremap = true, desc = "Substitute Line" })
-- 	vim.keymap.set("n", "S", substitute.eol, { noremap = true, desc = "Substitute EOL" })
-- 	vim.keymap.set("x", "ss", substitute.visual, { noremap = true, desc = "Substitute" })
--
-- 	-- exchange
-- 	local exchange = require("substitute.exchange")
-- 	vim.keymap.set("n", "sx", exchange.operator, { noremap = true, desc = "Exchange Operator" })
-- 	vim.keymap.set("n", "sxx", exchange.line, { noremap = true, desc = "Exchange Line" })
-- 	vim.keymap.set("x", "sx", exchange.visual, { noremap = true, desc = "Exchange" })
--
-- 	-- vim.keymap.set("n", "<leader>s", require("substitute.range").operator, { noremap = true })
-- 	-- vim.keymap.set("x", "<leader>s", require("substitute.range").visual, { noremap = true })
-- 	-- vim.keymap.set("n", "<leader>ss", require("substitute.range").word, { noremap = true })
-- end,
-- }
