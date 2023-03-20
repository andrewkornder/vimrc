LANGS = {
    ["python"] = { ext = "py", cmd = "!python311 %" },
    ["lua"] = { ext = "lua", cmd = "!lua %" },
    ["text"] = { ext = "txt", cmd = "!notepad %:h" }
}


if vim.fn.has("macunix") == 1 then
    LANGS.python.cmd = "!python3 %"
end


function get_run_command(mode)
    f_ext = vim.fn.expand("%:e")
    for name, info in pairs(LANGS) do
        if f_ext == info.ext then
            print(string.format("found a %s file", name))
            if mode == 1 then
                return "Bufferize " .. info.cmd:gsub("%%", vim.fn.expand("%"))
            end
            return info.cmd
        end
    end
    return "echo \"failed to find a known file format\""
end
