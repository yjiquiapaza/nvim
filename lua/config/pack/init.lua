local github = "https://github.com/"

vim.pack.add {
    { src = github .. "lewis6991/hover.nvim" },
    { src = github .. "RRethy/base16-nvim" },
    { src = github .. "nvim-lualine/lualine.nvim" },
    { src = github .. "nvim-mini/mini.icons" },
    { src = github .. "rcarriga/nvim-notify" },
    { src = github .. "L3MON4D3/LuaSnip", version = "v2.3.0" },
    { src = github .. "folke/trouble.nvim" },
    { src = github .. "folke/noice.nvim" },
    { src = github .. "MunifTanjim/nui.nvim" },
}

local pack_dir = vim.fn.stdpath "config" .. "/lua/config/pack"

for name, type in vim.fs.dir(pack_dir) do
    if type == "file" and name:match "%.lua$" and name ~= "init.lua" then
        local module = name:gsub("%.lua$", "")
        local ok, err = pcall(require, "config.pack." .. module)
        if not ok then
            vim.api.nvim_echo(
                { { "Error upload config.pack." .. module .. ": " .. tostring(err), "ErrorMsg" } },
                true,
                { err = true }
            )
        end
    end
end
