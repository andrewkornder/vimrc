vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- colors
    use "sainnhe/gruvbox-material"
    use { "rose-pine/neovim", as = "rose-pine" }
    use "folke/tokyonight.nvim"
    use "dracula/vim"
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
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    }

    -- session management
    use "xolox/vim-misc"
    use "xolox/vim-session"

    -- editing parens, quotes and other groups
    use "tpope/vim-surround"
end)
