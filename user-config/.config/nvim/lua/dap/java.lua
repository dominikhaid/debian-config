local dap = require("dap")
local java_home = os.getenv("HOME")
dap.configurations.java = {
  {
    --classPaths = {"src/main/java"},

    --projectName = "rest",

    javaExec = java_home .. "/.sdkman/candidates/java/current/bin/java",
    --mainClass = "KbbgApplication",

    --modulePaths = {},
    name = "Launch YourClassName",
    request = "launch",
    type = "java"
  }
}

--dap.adapters.java = function(callback)
--callback(
--{
--type = "server",
--host = "127.0.0.1",
--port = 5005
--}
--)
--end

--dap.configurations.java = {
--{
--type = "java",
--request = "attach",
--name = "Debug (Attach) - Remote",
--hostName = "127.0.0.1",
--port = 5005
--}
--}
