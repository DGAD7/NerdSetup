return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"tailwindcss",
				"cmake",
				"clangd", -- C++,C
				"gopls", -- Go
				"templ", -- Templ
				"pyright", -- Python
				"lua_ls", -- Lua
				"yamlls", -- YAML
				"lemminx", --XML
				"sqlls", --SQL
				"jsonls", --JSON
				"html",
				"dockerls",
				"cssls",
				"ansiblels",

			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		},
	}
}
