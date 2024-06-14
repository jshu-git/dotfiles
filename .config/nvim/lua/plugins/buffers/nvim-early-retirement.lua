return {
	"chrisgrieser/nvim-early-retirement",
	event = "VeryLazy",
	config = function()
		require("early-retirement").setup({
			retirementAgeMins = 10,
			notificationOnAutoClose = true,
			-- deleteBufferWhenFileDeleted = true,
		})
	end,
}
