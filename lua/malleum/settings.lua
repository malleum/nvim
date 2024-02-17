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
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Remaps
function Map(m, k, r)
    vim.keymap.set(m, k, r)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

Map("x", "<leader>p", "\"_dP")         -- void paste

Map({ "n", "v" }, "<leader>d", "\"_d") -- void delete
Map({ "n", "v" }, "<leader>D", "\"_D") -- void delete

Map({ "n", "v" }, "<leader>y", "\"+y") -- clipboard copy
Map({ "n", "v" }, "<leader>Y", "\"+y$")

Map("n", "<leader>c", vim.cmd.cn)
Map("n", "<leader>C", vim.cmd.cp)

vim.g.vindent_motion_OO_prev   = '[=' -- jump to prev block of same indent.
vim.g.vindent_motion_OO_next   = ']=' -- jump to next block of same indent.
vim.g.vindent_motion_more_prev = '[+' -- jump to prev line with more indent.
vim.g.vindent_motion_more_next = ']+' -- jump to next line with more indent.
vim.g.vindent_motion_less_prev = '[-' -- jump to prev line with less indent.
vim.g.vindent_motion_less_next = ']-' -- jump to next line with less indent.
vim.g.vindent_motion_diff_prev = '[;' -- jump to prev line with different indent.
vim.g.vindent_motion_diff_next = '];' -- jump to next line with different indent.
vim.g.vindent_motion_XX_ss     = '[p' -- jump to start of the current block scope.
vim.g.vindent_motion_XX_se     = ']p' -- jump to end   of the current block scope.
vim.g.vindent_object_XX_ii     = 'ii' -- select current block.
vim.g.vindent_object_XX_ai     = 'ai' -- select current block + one extra line  at beginning.
vim.g.vindent_object_XX_aI     = 'aI' -- select current block + two extra lines at beginning and end.
vim.g.vindent_jumps            = 1    -- make vindent motion count as a |jump-motion| (works with |jumplist|).
