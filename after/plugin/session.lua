vim.g.session_autosave = 'yes'
vim.g.session_autoload = 'yes'

vim.opt.sessionoptions = vim.opt.sessionoptions - "buffers"

vim.keymap.set("n", "<leader>ss", "<cmd>SaveSession<CR>", { remap = false })
vim.keymap.set("n", "<leader>so", "<cmd>OpenSession<CR>", { remap = false })
