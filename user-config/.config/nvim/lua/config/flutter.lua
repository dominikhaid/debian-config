-- alternatively you can override the default configs
require("flutter-tools").setup {
  ui = {
    border = "rounded"
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = false,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = false
    }
  },
  debugger = {
    -- integrate with nvim dap + install dart code debugger
    enabled = true
  },
  flutter_path = os.getenv("HOME") .. "/dev/flutter/bin/flutter", -- <-- this takes priority over the lookup
  --flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  widget_guides = {
    enabled = false
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    open_cmd = "tabedit" -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = true, -- autostart devtools server if not detected
    auto_open_browser = true -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  }
  --lsp = {
  --on_attach = my_custom_on_attach,
  --capabilities = my_custom_capabilities
  --capabilities = function(config)
  --config.specificThingIDontWant = false
  --return config
  --end,
  --settings = {
  --showTodos = true,
  --completeFunctionCalls = true,
  --analysisExcludedFolders = {<path-to-flutter-sdk-packages>}
  --}
  --}
}

require("telescope").load_extension("flutter")
