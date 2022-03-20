local dap = require("dap")
dap.adapters.python = {
  type = "executable",
  command = os.getenv("HOME") .. "/dev/virtualenvs/debugpy/bin/python3",
  args = {"-m", "debugpy.adapter"}
}

dap.configurations.python = {
  {
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",
    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return os.getenv("HOME") .. "/dev/virtualenvs/debugpy/bin/python3"
      end
    end
  }
}
