vim.pack.add {
    { src = "https://github.com/R-nvim/R.nvim" }, -- dependencia base
}

vim.cmd "packadd R.nvim"

require("r").setup {
    R_args = { "--quiet", "--no-save" },
}

