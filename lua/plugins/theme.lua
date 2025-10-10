-- ================================================================================================
-- TITLE : catppuccin-nvim
-- ABOUT : A subtle, warm colorscheme for Neovim inspired by Sublime Text's catppuccin theme.
-- LINKS :
--   > github : https://github.com/savq/catppuccin-nvim
-- ================================================================================================

return {
	"catppuccin/nvim",
  name = "catppuccin", 
	lazy = false,
    
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin")
	end,
}
