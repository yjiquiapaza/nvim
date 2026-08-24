vim.opt_local.textwidth = 80
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.colorcolumn = "80"
 
-- Atajos para formatear manualmente con gq
vim.keymap.set("n", "<leader>mp", "gqap", { buffer = true, desc = "Formatear párrafo" })
vim.keymap.set("n", "<leader>mf", "gggqG", { buffer = true, desc = "Formatear documento completo" })

local ok, wk = pcall(require, "which-key")
if ok then
    wk.add({
        { "<leader>m", group = "Formateo de texto (md/tex)" },
    })
end

