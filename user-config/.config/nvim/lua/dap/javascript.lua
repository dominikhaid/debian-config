local dap = require("dap")

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/dev/vscode-chrome-debug/out/src/chromeDebug.js"}
}

dap.adapters.node = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/dev/vscode-node-debug2/out/src/nodeDebug.js"}
}

dap.adapters.firefox = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/dev/vscode-firefox-debug/dist/adapter.bundle.js"}
}

local defaults = {
  restart = true,
  sourceMaps = true,
  stopOnEntry = true,
  cwd = vim.fn.getcwd(),
  protocol = "inspector",
  console = "integratedTerminal",
  webRoot = "${workspaceFolder}",
  internalConsoleOptions = "neverOpen",
  outFiles = {"${workspaceFolder}/**/*.js"},
  program = "${workspaceFolder}/${file}",
  --envFile = "${workspaceFolder}/.env.development",
  skipFiles = {"<node_internals>/**", "**/$KNOWN_TOOLS$/**", "**ts-dev-node**"}
}

local function mapTable(inTable, outTable)
  for k, v in pairs(inTable) do
    outTable[k] = v
  end
end

local defaultChrome = {
  type = "chrome",
  request = "launch",
  args = {"--remote-debugging-port=9222"},
  program = "${workspaceFolder}/${file}"
}
mapTable(defaults, defaultChrome)

local defaultChromeAttach = {
  type = "chrome",
  request = "attach",
  program = "${file}",
  ports = 9222
}
mapTable(defaults, defaultChromeAttach)

local launchChrome = {
  defaultChrome
}

local attachChrome = {
  defaultChromeAttach
}

local defaultNodemon = {
  type = "node",
  request = "launch",
  runtimeExecutable = "ts-node-dev"
}
mapTable(defaults, defaultNodemon)

local defaultNodemonAttach = {
  type = "node",
  request = "attach",
  port = 9229,
  runtimeExecutable = "ts-node-dev"
}
mapTable(defaults, defaultNodemonAttach)

local launchNodemon = {
  defaultNodemon
}

local defaultNext = {
  cwd = vim.fn.getcwd(),
  protocol = "inspector",
  console = "integratedTerminal",
  --webRoot = "${workspaceFolder}",
  --internalConsoleOptions = "neverOpen",
  --outFiles = {"${workspaceFolder}/**/*.js"},
  --program = "${workspaceFolder}/${file}",
  envFile = "${workspaceFolder}/.env.development",
  skipFiles = {"<node_internals>/**", "**/$KNOWN_TOOLS$/**", "**ts-dev-node**"},
  type = "node",
  port = 9229,
  request = "launch",
  runtimeExecutable = "npm",
  runtimeArgs = {"run-script", "next:debug"}
}
--mapTable(defaults, defaultNext)

local launchNext = {
  defaultNext
}

local defaultAttach = {
  type = "node",
  program = "${workspaceFolder}/${file}",
  runtimeExecutable = "ts-node-dev",
  pid = require "dap.utils".pick_process
}
mapTable(defaults, defaultAttach)

local attachProcess = {
  defaultAttach
}

dap.configurations.javascriptFirefox = {
  type = "firefox",
  request = "launch",
  reAttach = true,
  url = "http://localhost:3000",
  webRoot = "${workspaceFolder}",
  args = {"--start-debugger-server=9222"},
  keepProfileChanges = true,
  profile = "default",
  pathMappings = {
    {
      url = "webpack://_n_e/src",
      path = "${workspaceFolder}/src"
    },
    {
      url = "http://localhost:3000/",
      path = "${workspaceFolder}"
    }
  },
  firefoxExecutable = "/usr/bin/firefox"
}

-- RUN CONFIGS MAPPED TO HOTKEYS

dap.configurations.javascriptAttach = defaultAttach

dap.configurations.javascriptChrome = defaultChrome

dap.configurations.javascriptNext = defaultNext

-- DEFAULT DEBUG OPTIONS

dap.configurations.typescriptreact = attachChrome

dap.configurations.javascriptreact = attachChrome

dap.configurations.typescript = launchNodemon

dap.configurations.javascript = launchNodemon

-- THE NODE CONFIGS ARE JUST HERE IN CASE THERE IS NO TS-NODE-DEV AVAILABLE

local defaultNode = {
  type = "node",
  request = "launch"
}
mapTable(defaults, defaultNode)

local launchNode = {
  defaultNode
}

local defaultNodeAttach = {
  type = "node",
  request = "attach",
  program = "${file}",
  port = 9229
}
mapTable(defaults, defaultNodeAttach)

local attachNode = {
  defaultNodeAttach
}
