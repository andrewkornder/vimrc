-- help: (https://github.com/mfussenegger/nvim-jdtls#configuration-verbose)

local data_dir = "C:/Users/usr/AppData/Local/nvim" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
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
        "-jar", "C:/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuration", "C:/jdtls/config_win",
        "-data", data_dir,
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),--"C:/Users/usr/Desktop/code/java",
    autostart = true,
    filetypes = { "java" },
    settings = {
        java = {}
    },
    init_options = {
        bundles = {}
    },
}

--[[ vim.api.nvim_create_user_command("JavaAttach", "lua vim.lsp.buf_attach_client(0, 1)", {})
vim.api.nvim_create_user_command("JavaDetach", "lua vim.lsp.buf_detach_client(0, 1)", {})

vim.api.nvim_create_autocmd("FileType java", {
    pattern="*.java",
    callback = function(ev)
        print("triggered autocmd")
        vim.cmd.JavaAttach()
    end
})
]]-- 

require("jdtls").start_or_attach(config)
