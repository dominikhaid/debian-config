require("dap")
vim.fn.sign_define("DapBreakpoint", {text = "🛑", texthl = "", linehl = "", numhl = ""})
--require("dap.ui.widgets").hover()
require("dap.ext.vscode").load_launchjs()
