--require("base16-coloscheme").setup {
--vim.cmd('colorscheme base16-solarized-dark')
--vim.cmd('colorscheme base16-gruvbox-dark-soft')
--vim.cmd('colorscheme base16-gruvbox-material-light-medium')
--vim.cmd('colorscheme base16-measured-light')
-- vim.cmd('colorscheme base16-harmonic16-light')
--vim.cmd('colorscheme base16-nord-light')
--}
vim.pack.add {
    { src = "https://github.com/RRethy/base16-nvim" },
}
vim.o.background = "light"
vim.cmd.colorscheme "base16-rose-pine-dawn"
