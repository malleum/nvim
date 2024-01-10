return {
    {
        'unblevable/quick-scope',
        event = "VeryLazy",
        config = function()
            vim.cmd.highlight("QuickScopePrimary guifg='#00ff00' gui=underline ctermfg=155 cterm=underline")
            vim.cmd.highlight("QuickScopeSecondary guifg='#aa0000' gui=underline ctermfg=81 cterm=underline")
        end
    },
    {
        'mg979/vim-visual-multi',
        event = "VeryLazy"
    },
    {
        'tpope/vim-commentary',
        event = "VeryLazy"
    },
    {
        'tpope/vim-surround',
        event = "VeryLazy"
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {}
    },
    {
        "tpope/vim-fugitive",
        event = "VeryLazy"
    },
    {
        'mbbill/undotree',
        event = "VeryLazy",
        config = function()
            Map("n", "<leader>ut", vim.cmd.UndotreeToggle)
        end
    },
    {
        'aserowy/tmux.nvim',
        event = "VeryLazy",
        config = function()
            require("tmux").setup {}
        end
    },
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        "mboughaba/i3config.vim",
        event = "VeryLazy"
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
        event = "VeryLazy"
    },
    {
        "thosakwe/vim-flutter",
        event = "VeryLazy"
    }
}
