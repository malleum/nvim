return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        "<leader>ff",
        "<leader>h",
        "<leader>fg",
        "<leader>fs",
    },
    config = function()
        local t = require("telescope.builtin")
        Map("n", "<leader>ff", t.find_files)
        Map("n", "<leader>h", t.find_files)
        Map("n", "<leader>fg", t.git_files)
        Map("n", "<leader>fs", function() t.grep_string({ search = vim.fn.input("invenire > ") }) end)
    end,
}
