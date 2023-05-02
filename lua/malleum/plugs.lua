-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.git_files)
map("n", "<leader>fs", function()
    builtin.grep_string({ search = vim.fn.input("invenire > ") })
end)

-- Treesitter
require "nvim-treesitter.configs".setup {
    ensure_installed = { "fish", "python", "java", "kotlin", "c", "lua", "vim" },

    sync_install = true,
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

map("n", "<A-h>", function() ui.nav_file(1) end)
map("n", "<A-t>", function() ui.nav_file(2) end)
map("n", "<A-n>", function() ui.nav_file(3) end)
map("n", "<A-s>", function() ui.nav_file(4) end)

-- UndoTree
map("n", "<leader>ut", vim.cmd.UndotreeToggle)

-- Fugitive
map("n", "<leader>gs", vim.cmd.Git)

-- Visual Multi
vim.cmd("let g:VM_maps = {}")
vim.cmd("let g:VM_maps['Find Under'] = '<C-n>'")
vim.cmd("let g:VM_maps['Find Subword Under'] = '<C-n>'")

-- LSP Zero
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    "pyright",
    "kotlin_language_server",
    "lua_ls",
    "jdtls",
    "clangd",
})

lsp.on_attach(function(client, buf)
    local opts = { buffer = buf, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader><leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader><leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader><leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader><leader>rr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader><leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader><leader>f", function() vim.lsp.buf.format() end, opts)
end)

lsp.nvim_workspace()
lsp.setup()

-- Cellular Automation
map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
map("n", "<leader>mil", "<cmd>CellularAutomaton game_of_life<CR>")
map("n", "<leader>mis", "<cmd>CellularAutomaton slide<CR>")
map("n", "<leader>mid", "<cmd>CellularAutomaton down<CR>")

-- ToggleTerm
require("toggleterm").setup {
    open_mapping = [[<C-\>]]
}

-- Lua Line
require('lualine').setup {
    options = {
        color = { fg = '#000000' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'searchcount', 'filetype', 'filesize' },
        lualine_y = { 'location' },
        lualine_z = { function() return os.time() end, function() return os.date("%X") end }
    },
}
