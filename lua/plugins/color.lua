local color = "folke/tokyonight.nvim"
-- local color = "mhartington/oceanic-next"

return {
    {
        color,
        lazy = false,
        priority = 1000,
        dependencies = { 'xiyaowong/nvim-transparent' },
        config = function()
            if color == "mhartington/oceanic-next" then
                vim.cmd.colorscheme([[OceanicNext]])
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
                vim.cmd.TransparentEnable()
            else
                vim.cmd.TransparentDisable()
                vim.cmd.colorscheme([[tokyonight-night]])
            end
        end
    },
}
