return {
	{
		"williamboman/mason.nvim",
		version = "v2.0.1",
		config = function()
			require("mason").setup()
		end,
	}
}
