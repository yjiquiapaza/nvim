vim.pack.add {
    { src = "http://github.com/folke/which-key.nvim" },
}

require("which-key").setup {
    present = "modern",
}

require("which-key").add {
    { "<leader>x", group = "Trouble" },
    { "<leader>t", group = "Tree" },
    { "<leader>c", group = "Close" },
    { "<leader>g", group = "Git" },
    { "<leader>d", desc = "Diagnostic inline (LSP)" },
}
