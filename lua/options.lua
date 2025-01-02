vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")

vim.opt.swapfile = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

vim.cmd("set clipboard+=unnamedplus")


-- better indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- save
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- quickfix
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "CSn", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "CSp", vim.cmd.cnext, { desc = "Next Quickfix" })
