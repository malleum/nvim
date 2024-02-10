return {
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
        'mbbill/undotree',
        event = "VeryLazy",
        config = function()
            Map("n", "<leader>ut", vim.cmd.UndotreeToggle)
        end
    },
    {
        "ggandor/leap-spooky.nvim",
        event = "VeryLazy",
        dependencies = {
            "tpope/vim-repeat",
            "ggandor/leap.nvim",
        },
        config = function()
            require('leap').add_default_mappings()
            vim.keymap.del({ 'x', 'o' }, 'x')
            vim.keymap.del({ 'x', 'o' }, 'X')

            require("leap-spooky").setup()
        end
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
        event = "VeryLazy"
    },
    {
        "thosakwe/vim-flutter",
        event = "VeryLazy"
    },
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = "Okular"
            vim.g.vimtex_compiler_method = "latexrun"
        end
    },
    {
        "mboughaba/i3config.vim",
        event = "VeryLazy"
    }
}
