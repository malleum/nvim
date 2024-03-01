local o = vim.opt

-- tabbing
o.autoindent = true
o.expandtab = true
o.shiftwidth = 4
o.smarttab = true
o.softtabstop = 4
o.tabstop = 4

-- settings
o.mouse = ""
o.autoread = true
o.autowrite = true
o.cursorcolumn = true
o.cursorline = true
o.encoding = "utf-8"
o.history = 50
o.ignorecase = true
o.incsearch = true
o.hlsearch = false
o.ruler = false
o.showmode = false
o.wrap = false
o.nu = true
o.relativenumber = true
o.scrolloff = 7
o.smartcase = true
o.undofile = true
o.wildmenu = true
o.signcolumn = "yes"
o.cmdheight = 1
o.termguicolors = true
o.hidden = true
o.updatetime = 50

o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Remaps
function Map(m, k, r)
	vim.keymap.set(m, k, r)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

Map("c", "W", "w")
Map("n", "Y", "y$")

Map("n", "<leader>F", "mzgg=G`z")

Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

Map("n", "J", "mzJ1`z")
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "n", "nzz")
Map("n", "N", "Nzz")

Map("x", "<leader>p", '"_dP') -- void paste

Map({ "n", "v" }, "<leader>d", '"_d') -- void delete
Map({ "n", "v" }, "<leader>D", '"_D') -- void delete

Map({ "n", "v" }, "<leader>y", '"+y') -- clipboard copy
Map({ "n", "v" }, "<leader>Y", '"+y$')

Map("n", "<C-j>", "<cmd>cn<cr>zz")
Map("n", "<C-k>", "<cmd>cp<cr>zz")
