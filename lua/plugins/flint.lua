return {
    {
        "stevearc/conform.nvim",
        opts = {},
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff_format" },
                    nix = { "alejandra" },
                    ["*"] = { "trim_whitespace" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 500,
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
