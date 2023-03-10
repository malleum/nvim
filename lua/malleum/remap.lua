function map(m, k, r)
    vim.keymap.set(m, k, r)
end

vim.g.mapleader = " "
map("n", "<leader>", "")

map("n", "<leader>uh", vim.cmd.Ex)
map("c", "W", "w")
map("n", "Y", "y$")

map("n", "<leader>F", "mzgg=G`z")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ1`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

map("x", "<leader>p", "\"_dP") -- void paste

map({"n", "v"}, "<leader>d", "\"_d") -- void delete
map({"n", "v"}, "<leader>D", "\"_D") -- void delete

map({"n", "v"}, "<leader>y", "\"+y") -- clipboard copy
map({"n", "v"}, "<leader>Y", "\"+y$")

map({"n", "v"}, "<leader>P", "\"+p") -- clipboard paste

map("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace
map("n", "<leader>X", "<cmd>!chmod +x %<CR>") -- executable

map("n", "<leader>b", vim.cmd.bn)
map("n", "<leader>B", vim.cmd.bp)
