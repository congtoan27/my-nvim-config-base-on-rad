return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dapui = require("dapui")
		local dap = require("dap")
		vim.fn.sign_define("DapBreakpoint", {
			text = "⚪",
			texthl = "DapBreakpointSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapStopped", {
			text = "🔴",
			texthl = "yellow",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})
		vim.fn.sign_define("DapBreakpointRejected", {
			text = "⭕",
			texthl = "DapStoppedSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})
		--- open ui immediately when debugging starts
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- default configuration
		dapui.setup()
	end,
}
