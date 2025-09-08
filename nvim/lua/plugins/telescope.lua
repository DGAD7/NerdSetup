return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require("telescope").setup {
				pickers = {
					colorscheme = {
						enable_preview = true
					}
				}
			}
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
	},

	{
		'nvim-lua/plenary.nvim',
	}
}
