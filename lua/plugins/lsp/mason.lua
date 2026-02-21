return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
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
            "texlab",
            "ocamllsp",
            "jdtls",
            "ltex_plus",
        },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
        },
        "neovim/nvim-lspconfig",
    },
}
