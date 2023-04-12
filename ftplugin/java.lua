-- help: (https://github.com/mfussenegger/nvim-jdtls#configuration-verbose)
--
local config = {
    cmd = {'/Users/akornder25/.config/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    autostart=true,
}
require('jdtls').start_or_attach(config)
--[[

local data_dir, jar, config
if vim.fn.has('macunix') == 0 then
    data_dir = "C:/Users/usr/AppData/Local/nvim" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    jar = "C:/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
    config = "C:/jdtls/config_win"
else
    data_dir = "~/.config/nvim/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    jar = '/Users/akornder25/.config/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
    config = "~/.config/jdtls/config_mac/"
end


local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", jar,
        "-configuration", config,
        "-data", data_dir,
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    autostart = true,
    filetypes = { "java" },
    settings = {
        java = {}
    },
    init_options = {
        bundles = {}
    },
}

require("jdtls").start_or_attach(config)]]--
