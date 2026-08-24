vim.pack.add {
    { src = "https://github.com/stevearc/conform.nvim" },
}

-- Por precaución, dado el patrón que hemos visto con vim.pack y comandos
-- de usuario (:ConformInfo en este caso).
vim.cmd "packadd conform.nvim"

require("conform").setup {
    formatters_by_ft = {
        lua = { "stylua" },
        tex = { "latexindent" },
        html = { "biome" },
        astro = { "biome" },
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        vue = { "biome" },
        -- Conform corre estos tres en secuencia, igual que en formatter.nvim
        go = { "gofumpt", "goimports-reviser", "golines" },
        -- Equivalente al ["*"] de formatter.nvim: solo aplica a filetypes
        -- que NO tengan un formateador específico arriba.
        ["_"] = { "trim_whitespace" },
    },
    formatters = {
        -- goimports-reviser es built-in, pero necesita args extra para
        -- igualar el comportamiento que tenías (quitar imports sin usar
        -- y manejar alias).
        goimports_reviser = {
            prepend_args = { "-rm-unused", "-set-alias" },
        },
        latexindent = {
            append_args = { "-m", "-y=modifyLineBreaks:textWrapOptions:columns:80" },
        },
    },
}

vim.keymap.set({ "n", "v" }, "<leader>p", function()
    require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Buffer formatter" })
