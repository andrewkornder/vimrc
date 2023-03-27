LANGS = {
    ["py"] = { cmd = "!python311 %:p" },
    ["java"] = { cmd = "!javac *.java -classpath %:h && java %:r && del *.class" },
    ["lua"] = { cmd = "!lua %:p" },
    ["txt"] = { cmd = "!notepad %:p" }
}


if vim.fn.has("macunix") == 1 then
    LANGS.python.cmd = "!python3 %:p"
end


function get_run_command(mode)
    local f_ext = vim.fn.expand("%:e")
    local info = LANGS[f_ext]
    if info == nil then
        return "echo \"language is not configured\""
    end

    local cmd = info.cmd
    if cmd ~= nil then
        if mode == 1 then
            cmd = "Bufferize " .. cmd
        end
        return cmd
    end

    return "echo \"no command configured\""
end
