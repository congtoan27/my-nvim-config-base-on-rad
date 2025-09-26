-- or plugins/nuget.lua
return {
	"d7omdev/nuget.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "%__virtual.cs$" },
			},
		})
		require("nuget").setup()
	end,
}
