local builtin = require('telescope.builtin')

require("usr.run")
local search_cmd = { "git", "ls-files", "--cached" }
if true then
    local pattern = {}
    for name, _ in pairs(LANGS) do
        table.insert(pattern, [["*.]] .. name .. [["]])
    end
    table.insert(search_cmd, 3, table.concat(pattern, " "))
end

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
