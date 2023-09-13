return {
    {
        'mhartington/oceanic-next',
        lazy = false,
        priority = 1000,
        dependencies = {
            'xiyaowong/nvim-transparent'
        },
        config = function()
            vim.cmd.colorscheme('OceanicNext')
            vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        end
    },
}
