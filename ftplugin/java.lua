-- help: (https://github.com/mfussenegger/nvim-jdtls#configuration-verbose)
--

local jdtls = vim.g.user.path_to_vim .. "/jdtls"

local jar = jdtls .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local config_dir = jdtls .. "/config_" .. vim.g.user.os

local data_dir = vim.fn.stdpath("data") .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

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
        "-configuration", config_dir,
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

require("jdtls").start_or_attach(config)
