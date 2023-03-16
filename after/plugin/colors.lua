vim.opt.background = "dark"
vim.g.gruvbox_material_background = "soft"

vim.o.termguicolors = true
vim.cmd.colorscheme("gruvbox-material")

local bg = "#16161D"  -- eigengrau
vim.cmd("autocmd vimenter * hi Normal guibg="..bg)
vim.cmd("autocmd vimenter * hi EndOfBuffer guibg="..bg)

