vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--[[
" Buffer Maps "
--]]

vim.keymap.set("n", "<leader>h", "<c-w>h")
vim.keymap.set("n", "<leader>l", "<c-w>l")
vim.keymap.set("n", "<leader>j", "<c-w>j")
vim.keymap.set("n", "<leader>k", "<c-w>k")
vim.keymap.set("n", "<leader>vs", ":vsp<cr>")
vim.keymap.set("n", "<leader>hs", ":split<cr>")
vim.keymap.set("n", "<leader>bo", "<c-w>_ <c-w><bar>")
vim.keymap.set("n", "<leader>be", "<c-w>=")
