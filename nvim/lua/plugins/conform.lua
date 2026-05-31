return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			cpp = { "clang-format" },
			c = { "clang-format" },
			go = { "goimports", "gofmt" },
			templ = { "templ" },
			jq = { "jq" },
			yaml = { "prettier" },
			css = { "prettier" },
			-- cmake = { "cmake_format" },
			html = { "prettier" },
			python = { "isort", "black" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
