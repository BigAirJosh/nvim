return {
	{
		"ruifm/gitlinker.nvim",
		depends = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitlinker").setup()
		end,
	},
}
