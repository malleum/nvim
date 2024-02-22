return {
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    nix = { "alejandra" },
                    python = { "isort", "ruff_format" },
                    ["*"] = { "trim_whitespace" },
                },
            })
        end
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = { python = { "ruff" } }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function() lint.try_lint() end,
            })
        end
    }
}
