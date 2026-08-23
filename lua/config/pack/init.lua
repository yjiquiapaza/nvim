local pack_dir = vim.fn.stdpath "config" .. "/lua/config/pack"

for name, type in vim.fs.dir(pack_dir) do
    if type == "file" and name:match "%.lua$" and name ~= "init.lua" then
        local module = name:gsub("%.lua$", "")
        local ok, err = pcall(require, "config.pack." .. module)
        if not ok then
            vim.api.nvim_echo(
                { { "Error load config.pack." .. module .. ": " .. tostring(err), "ErrorMsg" } },
                true,
                { err = true }
            )
        end
    end
end
