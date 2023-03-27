require("usr.run")

vim.g.mapleader = " "


local function bind(modes, keymap, command, args)
    args = {} or args
    vim.keymap.set(modes, keymap, command, args)
end


bind("n", "<leader>pv", vim.cmd.Ex)

-- navigate tabs
bind("n", "<C-Left>", vim.cmd.tabprevious)
bind("n", "<C-Right>", vim.cmd.tabnext)

-- move selected line up or down
bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")

-- keep mouse pos while moving
bind("n", "J", "mzJ`z")
bind("n", "<C-d>", "<C-d>zz")
bind("n", "<C-u>", "<C-u>zz")
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

-- paste over selected text
bind("x", "<leader>p", [["_dP]])

-- copy into sys register nad paste from
bind("v", "<leader>y", [["_y]])
bind({ "n", "v" }, "<leader>Y", [["_Y]])
bind("i", "<C-v>", [[<Esc>"+pli]])
bind("n", "<C-v>", [["+p]])

-- actually delete text
bind({ "n", "v" }, "<leader>d", [["_d]])

-- exit terminal w <Esc>
bind("t", "<Esc>", [[<C-\><C-n>]])

-- quick format
local wfmt = function()
    vim.cmd("silent! wa!")
    vim.lsp.buf.format()
end
bind("n", "<leader><leader>", wfmt)

-- quickfix binds
bind("n", "<C-k>", "<cmd>cnext<CR>zz")
bind("n", "<C-j>", "<cmd>cprev<CR>zz")
bind("n", "<leader>k", "<cmd>lnext<CR>zz")
bind("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace for current word
bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- write to file and run file
local runf = function(mode)
    wfmt()
    vim.cmd(get_run_command(mode))
end

bind({ "n", "i", "v" }, "<F5>", function()
    runf(0)
end)
bind({ "n", "i", "v" }, "<F6>", function()
    runf(1)
end)

-- easy quitting vim
local function quit()
    wfmt()
    vim.cmd("SaveSession")
    vim.cmd.qa()
end
bind("n", "<F4>", quit)

-- set cwd to that of the current file
bind("n", "<leader>cd", "<cmd>cd %:p:h<CR>")

-- open nvim configs
local config, code
if vim.fn.has("macunix") == 1 then
    config = "~/.config/nvim/"
    code = "~/Documents/GitHub/"
else
    config = "~/AppData/Local/nvim/"
    code = "~/Desktop/code"
end

bind("n", "<leader>vpp", "<cmd>e " .. config .. "<CR>")
bind("n", "<leader>vpc", "<cmd>e " .. code .. "<CR>")

-- open file/folder in explorer
local open_command
if vim.fn.has("macunix") == 0 then
    open_command = "!explorer "
end
bind("n", "<leader>exp", "<cmd>silent " .. open_command .. "%:h<CR>")
