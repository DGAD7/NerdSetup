return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"davidmh/cspell.nvim",
			"williamboman/mason.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local cspell = require("cspell")

			-- Create the group once, globally
			-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				debug = true,
				sources = {
					-- diagnostics
					cspell.diagnostics,
					null_ls.builtins.diagnostics.golangci_lint,
					-- code actions
					cspell.code_actions,
				},
			})
		end,
	}
}
