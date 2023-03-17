local builtin = require('telescope.builtin')

require("usr.run")
local search_cmd = { "git", "ls-files", "-x" }
for _, info in pairs(LANGS) do
    search_cmd[3] = search_cmd[3] .. [[ "*.]] .. info.ext .. [["]]
    --  table.insert(search_cmd, "\"*."..info.ext.."\"")
end

local find_files = function()
    builtin.git_files({
        --      use_git_root=true,
        git_command = search_cmd,
        --      recurse_submodules=true,
    })
end


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
