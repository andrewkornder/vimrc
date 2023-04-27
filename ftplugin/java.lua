-- help: (https://github.com/mfussenegger/nvim-jdtls#configuration-verbose)
--

local data_dir, jar, config_dir
if vim.fn.has('macunix') == 0 then
    data_dir = "C:/Users/usr/AppData/Local/nvim" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    jar = "C:/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
    config_dir = "C:/jdtls/config_win"
else
    data_dir = "~/.config_dir/nvim/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    jar = '/Users/akornder25/.config_dir/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
    config_dir = "~/.config_dir/jdtls/config_mac/"
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
