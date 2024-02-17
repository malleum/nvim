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
    }
}
