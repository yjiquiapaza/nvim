vim.pack.add {
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
}

local opts = {
    options = {
        theme = "base16",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disable_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
            {
                function()
                    local ok, status = pcall(vim.ui.progress_status)
                    return (ok and status) or ""
                end,
            },
            "encoding",
            "fileformat",
            "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}

local ok, trouble = pcall(require, "trouble")
if ok then
    local symbols = trouble.statusline {
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- Necesario para que el fondo coincida con la sección de lualine
        hl_group = "lualine_c_normal",
    }
    table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
    })
else
    vim.api.nvim_echo(
        { { "lualine: Could not load trouble.nvim, LSP symbols disable", "ErrorMsg" } },
        true,
        { err = true }
    )
end

require("lualine").setup(opts)

vim.api.nvim_create_autocmd("LspProgress", {
    callback = function()
        vim.cmd.redrawstatus()
    end,
})
