vim.pack.add {
    { src = "https://github.com/OXY2DEV/markview.nvim" },
}

-- Fuerza el sourcing de plugin/ (registra comandos como :Markview),
-- mismo bug de vim.pack que hemos visto con otros plugins.
vim.cmd "packadd markview.nvim"

---@diagnostic disable-next-line: missing-fields
require("markview").setup {
    preview = {
        icon_provider = "mini", -- usa mini.icons, que ya tienes, en vez del proveedor interno
    },
}

-- Baja la intensidad del "blending" de color de fondo que usa markview
-- para resaltar bloques (default: 0.15 dark / 0.25 light — se sentía
-- muy vistoso con esos valores).
vim.g.markview_alpha = 0.08
