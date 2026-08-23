vim.pack.add {
    { src = "https://githug.com/sphamba/smear-cursor.nvim" },
}

require("smear_cursor").setup {
    cursor_color = "#bb9af7",
    cursor_color_insert_mode = "#bb9af7",
    hide_target_hack = true,
    --- dark = 0.2 | light = 0.4
    volume_reduction_exponent = 0.4,
    --- dark = 0.8 | light = 0.6
    max_shade_no_matrix = 0.6,
    legacy_computing_symbols_support = true,
}
