require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all"
    --ensure_installed = { "help", "typescript", "c", "python", "java", "lua" },
    --ensure_installed = "all",
    ensure_installed = { "help", "typescript", "c", "python", "java", "lua" },
    sync_install = false,

    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
