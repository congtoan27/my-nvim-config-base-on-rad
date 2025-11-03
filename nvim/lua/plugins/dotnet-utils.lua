return {
	"ramboe/ramboe-dotnet-utils",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		-- init.lua

		require("dap-scope-walker").setup({
			{
				interval = 500, -- conservative value here
				block = { "Static members", " _", ".Collections.", "DateTime" },
				block_insensitive = true,
				insensitive = true,
				center = true,
				exact = true,
				highlight = true,
			},
		})
	end,
}
