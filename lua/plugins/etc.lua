return {
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
