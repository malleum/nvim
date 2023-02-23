
-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.git_files)
map("n", "<leader>fs", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Treesitter
require"nvim-treesitter.configs".setup {
    ensure_installed = { "fish", "python", "java", "kotlin", "c", "lua", "vim", "help" },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>a", mark.add_file)
map("n", "<leader>e", ui.toggle_quick_menu)

map("n", "<C-h>", function() ui.nav_file(1) end)
map("n", "<C-t>", function() ui.nav_file(2) end)
map("n", "<C-n>", function() ui.nav_file(3) end)
map("n", "<C-s>", function() ui.nav_file(4) end)

-- UndoTree
map("n", "<leader>ut", vim.cmd.UndotreeToggle)

-- Fugitive
map("n", "<leader>gs", vim.cmd.Git)

-- Visual Multi
vim.cmd("let g:VM_maps = {}")
vim.cmd("let g:VM_maps['Find Under'] = '<C-b>'")
vim.cmd("let g:VM_maps['Find Subword Under'] = '<C-b>'")

-- LSP Zero
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.ensure_installed({
    "pyright",
    "kotlin_language_server",
    "lua_ls",
    "jdtls",
    "clangd",
})

lsp.nvim_workspace()
lsp.setup()

-- Cellular Automation
map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
map("n", "<leader>mil", "<cmd>CellularAutomaton game_of_life<CR>")

-- ToggleTerm
require("toggleterm").setup {
    open_mapping = [[<C-x>]]
}

-- Lua Line
require('lualine').setup {
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'searchcount', 'filetype', 'filesize'},
        lualine_y = {'location'},
        lualine_z = {function () return os.time() end, function () return os.date("%X") end}
    },
}
