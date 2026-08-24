vim.pack.add {
    { src = "https://github.com/NvChad/nvim-colorizer.lua" },
}

-- Fuerza el sourcing de plugin/ (registra comandos como :ColorizerToggle),
-- mismo bug de vim.pack que hemos visto con otros plugins.
vim.cmd "packadd nvim-colorizer.lua"

require("colorizer").setup {
    filetypes = { "*" },
    user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode.
        tailwind = true, -- Enable tailwind colors
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
}
