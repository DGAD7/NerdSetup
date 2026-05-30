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
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				debug = true,
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
				sources = {
					-- diagnostics
					cspell.diagnostics,
					null_ls.builtins.diagnostics.golangci_lint,
					-- formatting
					null_ls.builtins.formatting.clang_format,
					-- code actions
					cspell.code_actions,
				},
			})
		end,
	}
}
