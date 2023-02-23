
local o = vim.opt
local g = vim.g

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

-- Better whitespace
g.better_whitespace_enabled = 1
g.strip_whitespace_on_save = 1
g.strip_whitespace_confirm = 0
g.better_whitespace_guicolor = "darkblue"

-- Colorscheme
require("transparent").setup({
    enable = true,
    extra_groups = {
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
    },
})

vim.cmd.colorscheme('OceanicNext')

-- QuickScope
vim.cmd.highlight("QuickScopePrimary guifg='#00ff00' gui=underline ctermfg=155 cterm=underline")
vim.cmd.highlight("QuickScopeSecondary guifg='#aa0000' gui=underline ctermfg=81 cterm=underline")
