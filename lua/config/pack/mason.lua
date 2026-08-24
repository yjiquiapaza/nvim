-- ~/.config/nvim/lua/config/pack/mason.lua
--
-- Orden importa: mason.nvim tiene que setuparse ANTES que
-- mason-lspconfig.nvim (antes esto lo garantizaba la relación de
-- `dependencies` en el spec de lazy.nvim; acá lo hacemos explícito).

vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
}

require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

require("mason-lspconfig").setup {
    ensure_installed = {
        "astro",
        "emmet_ls",
        "cssls",
        "vue_ls",
        "lua_ls",
        "marksman",
        "pyright",
        "html",
        "jsonls",
        "ts_ls",
        "gopls",
        "rust_analyzer",
        "tailwindcss",
        "zls",
        "biome",
        "kotlin_language_server",
        "ocamllsp",
        "jdtls",
        "ltex_plus",
    },
}

-- Nota: las versiones actuales de mason-lspconfig.nvim (alineadas con la
-- API nativa de LSP de Neovim 0.11+) llaman a vim.lsp.enable() por vos
-- para cada servidor de ensure_installed -- no hace falta un
-- setup_handlers ni un loop manual de vim.lsp.enable() aparte. Las
-- capabilities que configuramos en lsp-capabilities.lua con
-- vim.lsp.config("*", {...}) se aplican como base a todos estos
-- automáticamente, sin importar en qué archivo se cargue primero.
