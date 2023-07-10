local function Java()
    local s
    if vim.g.user.os == "mac" then
        s = '/'
    else
        s = '\\'
    end

    local folder = vim.fn.expand("%:h") .. s

    vim.cmd("!javac " .. folder .. s .. "*.java -d " .. folder)
    vim.cmd("!java -cp " .. folder .. " %:t:r")
    if vim.g.user.os == "win" then
        vim.cmd("!del " .. folder .. s .. "*.class")
    else
        vim.cmd("!rm " .. folder .. s .. "*.class")
    end
end

local function JavaArg()
    local s
    if vim.g.user.os == "mac" then
        s = '/'
    else
        s = '\\'
    end

    local folder = vim.fn.expand("%:h") .. s

    vim.cmd("!javac " .. folder .. s .. "*.java -d " .. folder)

    local class = vim.fn.input("File? ")
    if class == "" then
        print("empty input")
        return
    end
    vim.cmd("!java -cp " .. folder .. " " .. class)
    if vim.g.user.os == "win" then
        vim.cmd("!del " .. folder .. "\\*.class")
    else
        vim.cmd("!rm " .. folder .. "/*.class")
    end
end

local function Python()
    local runner = "python311"
    if is_mac == 1 then
        runner = "python3"
    end
    vim.cmd("!" .. runner .. " %:p")
end

local function PythonArg()
    local runner = "python311"
    if is_mac == 1 then
        runner = "python3"
    end

    local file = vim.fn.input("File? ")
    vim.cmd("!" .. runner .. " %:p:h\\" .. file)
end

local function Lua()
    local config = vim.fn.stdpath("config")
    local folder = vim.fn.expand("%:p:h")
    if string.match(folder, config) then
        vim.cmd.so()
    else
        vim.cmd("!lua %")
    end
end

local function _rdefault()
    local filetype = vim.fn.expand("%:e")

    local lookup = {
        py = Python,
        java = Java,
        lua = Lua,
    }

    lookup[filetype]()
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
    elseif filetype == "py" then
        PythonArg()
    else
        _rdefault()
    end
end

vim.keymap.set({ "n", "i" }, "<F5>", RunFile)
vim.keymap.set({ "n", "i" }, "<F6>", RunWithArgs)
vim.api.nvim_create_user_command("Run", RunFile, {})
