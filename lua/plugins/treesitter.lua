local languages = {
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
    "elixir",
    "tsx",
    "gomod",
    "gosum",
    "gotmpl",
    "gowork",
    "julia",
    "bibtex",
    "bash",
    "regex",
}
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(languages)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
