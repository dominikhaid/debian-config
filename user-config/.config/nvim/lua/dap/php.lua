local dap = require("dap")

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/dev/vscode-php-debug/out/phpDebug.js"}
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003
  }
}
