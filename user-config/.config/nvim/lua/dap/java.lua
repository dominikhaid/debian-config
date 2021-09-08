local dap = require("dap")
dap.configurations.java = {
    {
     -- You need to extend the classPath to list your dependencies.
     -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
    --classPaths = {"src/main/java"},

    -- If using multi-module projects, remove otherwise.
    --projectName = "rest",

    javaExec = os.getenv("HOME").."/.sdkman/candidates/java/11.0.11.hs-adpt/bin/java",
    --mainClass = "KbbgApplication",

    -- If using the JDK9+ module system, this needs to be extended
    -- `nvim-jdtls` would automatically populate this property
    --modulePaths = {},
    name = "Launch YourClassName",
    request = "launch",
    type = "java"
  },
}
