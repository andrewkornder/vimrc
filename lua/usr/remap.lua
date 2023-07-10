vim.g.mapleader = " "
local function set(modes, keymap, command, args)
    vim.keymap.set(modes, keymap, command, args or {})
end


set("n", "<leader>pv", vim.cmd.Ex)

-- navigate tabs
set("n", "<C-Left>", vim.cmd.tabprevious)
set("n", "<C-Right>", vim.cmd.tabnext)

-- move selected line up or down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- keep mouse pos while moving
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- paste over selected text
set("x", "<leader>p", [["_dP]])

-- copy into sys register nad paste from
set("v", "<leader>y", [["_y]])
set({ "n", "v" }, "<leader>Y", [["_Y]])
set("i", "<C-v>", [[<Esc>"+pli]])
set("n", "<C-v>", [["+p]])

-- copy all of file
set({ "n", "v", "i" }, "<C-a>", [[ggVG]])

-- actually delete text w/o copying
set({ "n", "v" }, "<leader>d", [["_d]])

-- exit terminal w <Esc>
set("t", "<Esc>", [[<C-\><C-n>]])

-- quick format
local wfmt = function()
    vim.cmd("silent! wa!")
    vim.lsp.buf.format()
end
set("n", "<leader><leader>", wfmt)

-- quickfix binds
set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace for current word
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- easy quitting vim
local function quit()
    wfmt()
    vim.cmd("SaveSession")
    vim.cmd.qa()
end
set("n", "<F4>", quit)

-- set cwd to that of the current file
set("n", "<leader>cd", "<cmd>cd %:p:h<CR>")

-- open nvim configs
local config = vim.fn.stdpath("config")

set("n", "<leader>vp", "<cmd>e " .. config .. "<CR>")
set("n", "<leader>vc", "<cmd>e " .. vim.g.user.code .. "<CR>")
set("n", "<leader>vf", "<cmd>e " .. vim.g.user.folders .. "<CR>")

-- open file/folder in explorer
local open_command
if vim.g.user.os == "mac" then
    open_command = "open"
else
    open_command = "start"
end

set("n", "op", "<cmd>silent !" .. open_command .. " %:h<CR>")
