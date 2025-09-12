return {
	"nvim-neotest/neotest",
	commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c", -- THIS ONE
	requires = {
		{
			"Issafalcon/neotest-dotnet",
		},
	},
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
