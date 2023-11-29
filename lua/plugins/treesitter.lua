
return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
        require "nvim-treesitter.configs".setup {
        ensure_installed = { "fish", "python", "java", "kotlin", "c", "lua", "vim", "nix"},

        sync_install = true,
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
    end
}
