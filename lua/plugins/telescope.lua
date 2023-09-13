return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = "VeryLazy",
    config = function()
        local t = require("telescope.builtin")
        Map("n", "<leader>h", t.find_files)
        Map("n", "<leader>fg", t.git_files)
        Map("n", "<leader>fd", ":Telescope diagnostics<cr>")
        Map("n", "<leader>fs", function() t.grep_string({ search = vim.fn.input("invenire > ") }) end)
    end,
}
