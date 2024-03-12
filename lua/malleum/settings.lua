local o = vim.opt

-- tabbing
o.autoindent = true
o.expandtab = true
o.shiftwidth = 4
o.smarttab = true
o.softtabstop = 4
o.tabstop = 4

-- settings
o.autoread = true
o.autowrite = true
o.cmdheight = 1
o.cursorcolumn = true
o.cursorline = true
o.encoding = "utf-8"
o.hidden = true
o.history = 50
o.hlsearch = false
o.ignorecase = true
o.incsearch = true
o.mouse = ""
o.number = true
o.relativenumber = true
o.ruler = false
o.scrolloff = 7
o.showmode = false
o.signcolumn = "yes"
o.smartcase = true
o.termguicolors = true
o.undofile = true
o.updatetime = 50
o.wildmenu = true
o.wrap = false

o.backup = false
o.swapfile = false
o.undofile = true
o.writebackup = false

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Remaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("c", "W", "w")
vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "<leader>F", "mzgg=G`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ1`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("x", "<leader>p", '"_dP') -- void paste

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d') -- void delete
vim.keymap.set({ "n", "v" }, "<leader>D", '"_D') -- void delete

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- clipboard copy
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+y$')

vim.keymap.set("n", "<C-j>", "<cmd>cn<cr>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cp<cr>zz")
