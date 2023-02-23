function map(m, k, r)
    vim.keymap.set(m, k, r)
end
-- Josh
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ1`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

map("x", "<leader>p", "\"_dP") -- void paste

map({"n", "v"}, "<leader>d", "\"_d") -- void delete

map({"n", "v"}, "<leader>y", "\"+y") -- clipboard copy
map({"n", "v"}, "<leader>Y", "\"+y$")

map({"n", "v"}, "<leader>v", "\"+p") -- clipboard paste

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace
map("n", "<leader>x", "<cmd>!chmod +x %<CR>") -- executable

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.git_files)
map("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
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
vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>mil", "<cmd>CellularAutomaton game_of_life<CR>")
