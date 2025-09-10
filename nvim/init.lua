vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true          -- Show absolute line numbers
vim.opt.relativenumber = false -- Show relative line numbers
vim.diagnostic.open_float(nil, { max_width = 120, max_height = 20 })
vim.opt.wrap = false
vim.diagnostic.config({
	virtual_text = {
		spacing = 6, -- space between code and diagnostic text
		source = "always", -- show the source (LSP, etc.)
	},
	signs = true,      -- show signs in the gutter
	underline = true,  -- underline problematic code
	update_in_insert = false, -- don't update diagnostics while typing
})


require("config.lazy")
