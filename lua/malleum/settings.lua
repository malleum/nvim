
local o = vim.opt
local a = vim.api

vim.cmd.colorscheme('OceanicNext')
a.nvim_set_hl(0, "Normal", {bg = "none"})
a.nvim_set_hl(0, "NormalFloat", {bg = "none"})

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
o.clipboard = "unnamedplus"
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
o.signcolumn = "number"
o.cmdheight = 2
o.termguicolors = true
o.hidden = true
o.updatetime = 50

o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"


