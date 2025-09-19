return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui", -- giao diện đẹp cho dap
		"theHamsta/nvim-dap-virtual-text",
		event = "VeryLazy",

		"nvim-neotest/nvim-nio", -- cần cho dap-ui
	},
	config = function()
		local dap = require("dap")

		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

		local netcoredbg_adapter = {
			type = "executable",
			command = mason_path,
			args = { "--interpreter=vscode" },
		}

		dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
		dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					-- return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/src/", "file")
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
				end,

				-- justMyCode = false,
				-- stopAtEntry = false,
				-- -- program = function()
				-- --   -- todo: request input from ui
				-- --   return "/path/to/your.dll"
				-- -- end,
				-- env = {
				--   ASPNETCORE_ENVIRONMENT = function()
				--     -- todo: request input from ui
				--     return "Development"
				--   end,
				--   ASPNETCORE_URLS = function()
				--     -- todo: request input from ui
				--     return "http://localhost:5050"
				--   end,
				-- },
				-- cwd = function()
				--   -- todo: request input from ui
				--   return vim.fn.getcwd()
				-- end,
			},
		}

		local map = vim.keymap.set

		local opts = { noremap = true, silent = true }

		map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
		map("n", "<F6>", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
		map("n", "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
		map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
		map("n", "<F12>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
		map("n", "<F8>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
		-- map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
		map("n", "<leader>du", function()
			require("dapui").toggle()
		end, { noremap = true, silent = true, desc = "Toggle DAP UI" })

		map({ "n", "v" }, "<leader>dw", function()
			require("dapui").eval(nil, { enter = true })
		end, { noremap = true, silent = true, desc = "Add word under cursor to Watches" })

		map({ "n", "v" }, "Q", function()
			require("dapui").eval()
		end, {
			noremap = true,
			silent = true,
			desc = "Hover/eval a single value (opens a tiny window instead of expanding the full object) ",
		})
		map("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
		map("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
		map(
			"n",
			"<leader>dt",
			"<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
			{ noremap = true, silent = true, desc = "debug nearest test" }
		)
	end,
}
