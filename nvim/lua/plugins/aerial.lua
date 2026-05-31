return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial (Code Outline)" },
	},
	opts = {
		-- Prioritize LSP for accuracy, fallback to Treesitter
		backends = { "lsp", "treesitter", "markdown", "man" },
		layout = {
			max_width = { 40, 0.2 },
			width = nil,
			min_width = 25,
			default_direction = "right",
		},
		show_guides = true,
	},
}
