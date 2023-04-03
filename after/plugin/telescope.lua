local builtin = require('telescope.builtin')

local find_files = function()
    builtin.git_files({
        use_git_root = true,
        git_command = search_cmd,
    })
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags)
