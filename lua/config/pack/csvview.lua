-- lua/config/pack/csvview.lua

vim.pack.add({
    { src = "https://github.com/hat0uma/csvview.nvim" },
})

-- Fuerza el sourcing de plugin/ (registra :CsvViewToggle, :CsvViewEnable,
-- :CsvViewDisable, :CsvViewInfo), mismo bug de vim.pack que hemos visto
-- con otros plugins.
vim.cmd("packadd csvview.nvim")

require("csvview").setup({
    parser = {
        comments = { "#", "//" },
    },
    view = {
        display_mode = "border", -- delimitadores como línea vertical │, no solo resaltados
        min_column_width = 5,
        spacing = 2,
    },
    keymaps = {
        -- Text objects para seleccionar campos
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Navegación estilo Excel: Tab/S-Tab entre columnas,
        -- Enter/S-Enter entre filas
    },
})

-- Colores por columna ("rainbow"), delimitador y header.
-- Envuelto en un autocmd ColorScheme: aplicar un colorscheme limpia los
-- highlights personalizados, así que hay que reaplicarlos cada vez que
-- eso pase (sin importar si theme.lua carga antes o después de este archivo).
local function set_csvview_highlights()
    vim.api.nvim_set_hl(0, "CsvViewDelimiter", { fg = "#9893a5", bold = true })
    vim.api.nvim_set_hl(0, "CsvViewHeaderLine", { fg = "#286983", bold = true, underline = true })
    vim.api.nvim_set_hl(0, "CsvViewCol0", { fg = "#b4637a" }) -- rosa
    vim.api.nvim_set_hl(0, "CsvViewCol1", { fg = "#ea9d34" }) -- naranja
    vim.api.nvim_set_hl(0, "CsvViewCol2", { fg = "#d7827e" }) -- coral
    vim.api.nvim_set_hl(0, "CsvViewCol3", { fg = "#286983" }) -- azul
    vim.api.nvim_set_hl(0, "CsvViewCol4", { fg = "#56949f" }) -- teal
    vim.api.nvim_set_hl(0, "CsvViewCol5", { fg = "#907aa9" }) -- violeta
    vim.api.nvim_set_hl(0, "CsvViewCol6", { fg = "#ea9d34" }) -- ámbar
    vim.api.nvim_set_hl(0, "CsvViewCol7", { fg = "#b4637a" }) -- rosa oscuro
    vim.api.nvim_set_hl(0, "CsvViewCol8", { fg = "#575279" }) -- morado gris
end

set_csvview_highlights() -- por si el colorscheme ya cargó antes que este archivo
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_csvview_highlights,
})

vim.keymap.set("n", "<leader>cv", "<cmd>CsvViewToggle<CR>", { desc = "Alternar vista CSV" })
