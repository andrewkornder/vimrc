local is_mac = vim.fn.has("macunix")

local function Java()
    local folder = vim.fn.expand("%:p:h")

    vim.cmd("!javac " .. folder .. "\\*.java -d " .. folder)
    vim.cmd("!java -cp " .. folder .. " %:t:r")
    vim.cmd("!del " .. folder .. "\\*.class")
end

local function JavaArg()
    local folder = vim.fn.expand("%:p:h")

    vim.cmd("!javac " .. folder .. "\\*.java -d " .. folder)

    local class = vim.fn.input("File? ")
    vim.cmd("!java -cp " .. folder .. " " .. class)
    vim.cmd("!del " .. folder .. "\\*.class")
end

local function Python()
    local runner = "python311"
    if is_mac == 1 then
        runner = "python3"
    end
    vim.cmd("!" .. runner .. " %:p")
end

local function Lua()
    local config = vim.fn.stdpath("config")
    if string.match(folder, config) then
        vim.cmd.so()
        print(1)
    else
        vim.cmd("!lua %")
    end
end

local function _rdefault()
    local filetype = vim.fn.expand("%:e")

    if filetype == "py" then
        Python()
    elseif filetype == "java" then
        Java()
    elseif filetype == "lua" then
        Lua()
    end
end

function RunFile()
    vim.cmd.wa()
    _rdefault()
end

function RunWithArgs()
    vim.cmd.wa()

    local filetype = vim.fn.expand("%:e")

    if filetype == "java" then
        JavaArg()
    else
        _rdefault()
    end
end

vim.keymap.set({ "n", "i" }, "<F5>", RunFile)
vim.keymap.set({ "n", "i" }, "<F6>", RunWithArgs)
vim.api.nvim_create_user_command("Run", RunFile, {})
