return {
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function ()
        require("todo-comments").setup {}
        vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")
    end
}
