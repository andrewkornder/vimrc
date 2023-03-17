IS_UNIX = vim.fn.has("macunix")
LANGS = {
    ["python"] = {ext="py", cmd="!python %"},
    ["lua"] = {ext="lua", cmd="!lua %"},
    ["text"] = {ext="txt", cmd="cd %:h"}
}


get_run_command = function()
    f_ext = vim.fn.expand("%:e")
    for name, info in pairs(LANGS) do
        if f_ext == info.ext then
            print(string.format("found a %s file", name))
            return info.cmd
        end
    end
    print("failed to find a known file format")
end


if IS_UNIX then
    LANGS.python.cmd = "!python3 %"
end
