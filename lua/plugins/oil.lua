return {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
        })

        Map("n", "-", vim.cmd.Oil)
    end
}
