local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- Dap Virtual Text
dap_virtual_text.setup()

mason_dap.setup({
	ensure_installed = { "python", "cppdbg", "node2", "js", "bash" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

-- Dap UI
ui.setup()
vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

-- Keymaps
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint", nowait = true, remap = false })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue", nowait = true, remap = false })
vim.keymap.set("n", "<leader>ds", dap.step_into, { desc = "Step Into", nowait = true, remap = false })
vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step Over", nowait = true, remap = false })
vim.keymap.set("n", "<leader>dr", dap.step_out, { desc = "Step Out", nowait = true, remap = false })
vim.keymap.set("n", "<leader>di", dap.repl.open, { desc = "Open REPL", nowait = true, remap = false })
vim.keymap.set("n", "<leader>dp", dap.run_last, { desc = "Run Last", nowait = true, remap = false })
vim.keymap.set("n", "<leader>dl", dap.list_breakpoints, { desc = "List Breakpoints", nowait = true, remap = false })
vim.keymap.set("n", "<leader>de", function()
  dap.set_exception_breakpoints({ "all" })
end, { desc = "Set Exception Breakpoints", nowait = true, remap = false })

vim.keymap.set("n", "<leader>dq", function()
  dap.terminate()
  ui.close()
  dap_virtual_text.toggle()
end, { desc = "Terminate", nowait = true, remap = false })

-- Python
local venv_bin_python = os.getenv("VIRTUAL_ENV") and (os.getenv("VIRTUAL_ENV") .. "/bin/python") or nil
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = venv_bin_python,
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(venv_bin_python) == 1 then
        return venv_bin_python
      elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- Node
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  -- args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
  args = {os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
