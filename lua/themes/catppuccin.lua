-- Load the best theme in the world "Or I'll eat your soul"
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme 'catppuccin-macchiato'
	end,
}
