return {
	"barrett-ruth/live-server.nvim",
	build = "npm install -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = true,
	keys = {
		{ "<leader>ls", ":LiveServerStart<cr>", desc = "Live Server Start" },
		{ "<leader>lx", ":LiveServerStop<cr>", desc = "Live Server Stop" },
	},
}
