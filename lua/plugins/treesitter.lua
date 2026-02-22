return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
        pcall(require, "nvim-treesitter.query_predicates")
    end,
    opts = {
        ensure_installed = {
            "javascript",
            "typescript",
            "go",
            "rust",
            "zig",
            "java",
            "lua",
            "css",
            "yaml",
            "html",
            "kotlin",
            "vue",
            "json",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "astro",
            "latex",
            "toml",
            "markdown",
            "markdown_inline",
            "elixir",
            "tsx",
            "gomod",
            "gosum",
            "gotmpl",
            "gowork",
            "julia",
            "bibtex",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if ok then
            configs.setup(opts)
        end
    end,
}
