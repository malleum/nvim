function Map(m, k, r)
    vim.keymap.set(m, k, r)
end

vim.g.mapleader = " "
Map("n", "<leader>", "")

Map("n", "<leader>uh", vim.cmd.Ex)
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

Map("x", "<leader>p", "\"_dP") -- void paste

Map({"n", "v"}, "<leader>d", "\"_d") -- void delete
Map({"n", "v"}, "<leader>D", "\"_D") -- void delete

Map({"n", "v"}, "<leader>y", "\"+y") -- clipboard copy
Map({"n", "v"}, "<leader>Y", "\"+y$")

Map({"n", "v"}, "<leader>P", "\"+p") -- clipboard paste

Map("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace
Map("n", "<leader>X", "<cmd>!chmod +x %<CR>") -- executable

Map("n", "<leader>b", vim.cmd.bn)
Map("n", "<leader>B", vim.cmd.bp)
