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
        'udalov/kotlin-vim',
        event = "VeryLazy"
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy", opts = {}
    },
    {
        -- gA to show numbers in base 10, 2 , 8, 16
        -- crd crb cro crx
        'glts/vim-radical',
        dependencies = 'glts/vim-magnum',
        event = "VeryLazy"
    },
}
