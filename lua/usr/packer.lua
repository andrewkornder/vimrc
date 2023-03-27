vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- colors
    use "sainnhe/gruvbox-material"
    use { "rose-pine/neovim", as = "rose-pine" }
    use { "dracula/vim", as = "dracula" }
    use "folke/tokyonight.nvim"
    use "drewtempelmeyer/palenight.vim"

    use "zefei/vim-colortuner"

    -- fuzzy-finder and harpoon
    use { "nvim-telescope/telescope.nvim",
        tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } }
    use "theprimeagen/harpoon"

    -- error window
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                use_diagnostic_signs = true,
                auto_fold = true,
            }
        end
    })

    -- syntax highlighting and lsp
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "neovim/nvim-lspconfig"
    use "mfussenegger/nvim-jdtls"

    use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'         -- Snippets plugin
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"


    --[[use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            -- { "williamboman/mason.nvim" },
            -- { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            -- Snippets
            { "rafamadriz/friendly-snippets" },
        }
    }]]
        --

    -- session management
    use "xolox/vim-misc"
    use "xolox/vim-session"

    -- editing parens, quotes and other groups
    use "tpope/vim-surround"

    -- easier access to console output
    use "AndrewRadev/bufferize.vim"
end)
