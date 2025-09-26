return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dapui = require("dapui")
		local dap = require("dap")
		vim.fn.sign_define("DapBreakpoint", {
			text = "🚨",
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
			text = "🔵",
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
		--		dapui.setup()
		-- more minimal ui
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			highlight_changed_variables = true,
			show_stop_reason = true,
			commented = false,
		})

		dapui.setup({
			expand_lines = true,
			controls = { enabled = true }, -- no extra play/step buttons
			floating = { border = "rounded" },
			-- Set dapui window
			render = {
				max_type_length = 60,
				max_value_lines = 200,
			},
			-- Only one layout: just the "scopes" (variables) list at the bottom
			-- layouts = {
			-- 	{
			-- 		elements = {
			-- 			{ id = "scopes", size = 1.0 }, -- 100% of this panel is scopes
			-- 		},
			-- 		size = 15, -- height in lines (adjust to taste)
			-- 		position = "bottom", -- "left", "right", "top", "bottom"
			-- 	},
			-- },
		})
	end,
}
