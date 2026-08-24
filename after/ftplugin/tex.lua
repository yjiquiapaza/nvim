vim.opt_local.colorcolumn = "80"
vim.opt_local.textwidth = 80
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

-- Se mantiene tu decisión original: sin auto-wrap mientras escribes.
-- El ancho ya es de 80 para que coincida con latexindent, pero el
-- reflow sigue siendo manual, como ya lo tenías.
vim.opt_local.formatoptions:remove { "t", "c" }

-- Atajos para formatear manualmente con gq (ver config/pack/conform.lua
-- para el formateo automático vía latexindent + <leader>p)
vim.keymap.set("n", "<leader>mp", "gqap", { buffer = true, desc = "Formatear párrafo" })
vim.keymap.set("n", "<leader>mf", "gggqG", { buffer = true, desc = "Formatear documento completo" })

local ok, wk = pcall(require, "which-key")
if ok then
    wk.add {
        { "<leader>m", group = "Formateo de texto (md/tex)" },
    }
end
