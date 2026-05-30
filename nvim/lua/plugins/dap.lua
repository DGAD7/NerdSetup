return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{ "<F5>",      function() require("dap").continue() end,          desc = "DAP Continue" },
			{ "<F10>",     function() require("dap").step_over() end,         desc = "DAP Step Over" },
			{ "<F11>",     function() require("dap").step_into() end,         desc = "DAP Step Into" },
			{ "<F12>",     function() require("dap").step_out() end,          desc = "DAP Step Out" },
			{ "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "DAP Toggle Breakpoint" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("nvim-dap-virtual-text").setup()
			dapui.setup()

			-- Automatically open/close the DAP UI when debugging starts/stops
			dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
			dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
			dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

			-- Setup LLDB for C/C++ debugging
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode", -- You may need to change this to 'lldb-dap' depending on your LLVM version
				name = "lldb",
			}

			dap.configurations.cpp = {
				{
					name = "Launch Executable",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
							"file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.c = dap.configurations.cpp
		end,
	},
}
