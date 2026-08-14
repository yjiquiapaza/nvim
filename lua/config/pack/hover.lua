require("hover").config {
    providers = {
        "hover.providers.diagnostic",
        "hover.providers.lsp",
        --"hover.providers.man",
        --"hove.providers.dictionary",
    },
    preview_opts = {
        border = "rounded",
    },
    preview_window = false,
    title = true,
}

--  Honver keymaps configuration
vim.keymap.set("n", "K", function()
    require("hover").open()
end, { desc = "Hover (diagnostics or LSP)" })
vim.keymap.set("n", "gK", function()
    require("hover").enter()
end, { desc = "Hover: enter to the windows" })
