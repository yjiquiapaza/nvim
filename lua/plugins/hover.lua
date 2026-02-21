return {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").config {
            providers = {
                "hover.providers.diagnostic",
                "hover.providers.lsp",
                "hover.providers.man",
                "hove.providers.dictionary",
            },
            preview_opts = {
                border = "single",
            },
            preview_window = false,
            title = true,
            mouse_providers = {
                "hover.providers.lsp",
            },
            mouse_delay = 1000,
        }

        vim.keymap.set("n", "K", function()
            require("hover").open()
        end, { desc = "hover.nvim" })
        vim.keymap.set("n", "gK", function()
            require("hover").enter()
        end, { desc = "hover.nvim (select)" })
    end,
}
