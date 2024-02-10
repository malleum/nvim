return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = "VeryLazy",
    config = function()
        local t = require("telescope.builtin")

        Map("n", "<C-p>", t.find_files)
        Map("n", "<leader>pp", t.git_files)
        Map("n", "<leader>pd", t.diagnostics)
        Map("n", "<leader>ph", t.help_tags)
        Map("n", "<leader>pr", t.lsp_references)

        Map("n", "<leader>ps", function() t.grep_string({ search = vim.fn.input("invenire > ") }) end)
        Map("n", "<leader>pws", function() t.grep_string({ search = vim.fn.expand("<cword>") }) end)
        Map("n", "<leader>pWs", function() t.grep_string({ search = vim.fn.expand("<cWORD>") }) end)
    end,
}
