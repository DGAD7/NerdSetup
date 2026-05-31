return {
	{
		"williamboman/mason.nvim",
		version = "v2.3.0",
		config = function()
			require("mason").setup()
		end,
	}
}
