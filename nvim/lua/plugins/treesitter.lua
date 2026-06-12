vim.api.nvim_create_autocmd("FileType", {
	pattern = "templ",
	callback = function()
		vim.bo.commentstring = "<!-- %s -->"
	end,
})

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"cmake",
				"bash",
				"python",
				"go",
				"markdown",
				"markdown_inline",
				"regex",
				"templ",
				"html",
				"dockerfile",
				"yaml",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
