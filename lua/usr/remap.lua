vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep mouse pos while moving
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over selected text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy into sys register nad paste from
vim.keymap.set("v", "<leader>y", [["_y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["_Y]])
vim.keymap.set("i", "<C-v>", [["+p"]])

-- actually delete text
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- exit terminal w <Esc>
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- quick format
wfmt = function()
	vim.cmd.wa()
	vim.lsp.buf.format()
end
vim.keymap.set("n", "<leader>f", wfmt)

-- quickfix binds
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace for current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- write to file and run file
execs = {
	["py"] = "python",
	["lua"] = "lua",
	["default"] = ""
}
runf = function()
	wfmt()
	ext = vim.fn.expand("%:p")
	if execs[ext] then
		vim.cmd(string.format("![%s] %", execs[ext]))
	end
end
vim.keymap.set({ "n", "i", "v" }, "<F5>", runf)

-- set cwd to that of the current file
vim.keymap.set("n", "cwd", "<cmd>silent cd %:p:h<CR>")
