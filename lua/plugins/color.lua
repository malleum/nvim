return {
    {
        'mhartington/oceanic-next',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('OceanicNext')
            vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        end
    },
    {
        'folke/tokyonight.nvim',
        event = "VeryLazy",
    },
    {
        'EdenEast/nightfox.nvim',
        event = "VeryLazy",
    },
    {
        'ntpeters/vim-better-whitespace',
        event = "VeryLazy",
        config = function()
            vim.g.better_whitespace_enabled = 1
            vim.g.strip_whitespace_on_save = 1
            vim.g.strip_whitespace_confirm = 0
            vim.g.better_whitespace_guicolor = "darkblue"
        end
    },
    {
        'xiyaowong/nvim-transparent',
    },
}
