
return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = "BufEnter",
    config = function()
        require "nvim-treesitter.configs".setup {
        ensure_installed = { "fish", "python", "java", "kotlin", "c", "lua", "vim" },

        sync_install = true,
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
    end
}
