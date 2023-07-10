local json = os.getenv("u_data")
local file = io.open(json, "r"):read("a")

local lookup = vim.json.decode(file)

vim.g.user = lookup[vim.fn.hostname()]
vim.api.nvim_create_user_command("Info", function() print(file) end, {})
