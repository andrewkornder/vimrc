local cmd = { vim.g.user.nvim .. '/lua_ls/bin/lua-language-server.exe' }

local config = {
    cmd = cmd,
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

require("lspconfig").lua_ls.setup(config)

