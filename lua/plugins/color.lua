return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        dependencies = {
            "xiyaowong/transparent.nvim"
        },
        config = function()
            vim.cmd.colorscheme([[tokyonight-night]])
        end
    },
}
