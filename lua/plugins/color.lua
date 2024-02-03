local color = "folke/tokyonight.nvim"

return {
    {
        color,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme([[tokyonight-night]])
        end
    },
}
