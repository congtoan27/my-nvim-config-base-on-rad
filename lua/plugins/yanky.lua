return {
	"gbprod/yanky.nvim",
	dependencies = { "hrsh7th/nvim-cmp" },
	"nvim-telescope/telescope.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
		vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
		vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
		vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
		vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
		vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

		local telescope = require("telescope")
		telescope.load_extension("yank_history")
		map("n", "<leader>fy", "<cmd>Telescope yank_history<CR>", { desc = "Yank history" })
	end,
}
