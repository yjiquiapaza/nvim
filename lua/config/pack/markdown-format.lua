-- gq necesita 'textwidth' definido para saber a qué ancho envolver el
-- texto. conform.nvim no formatea markdown, así que esto cubre ese hueco.

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "tex"},
    callback = function(ev)
        vim.opt_local.textwidth = 80
        vim.opt_local.formatoptions:append "t" -- auto-wrap mientras escribes

        -- Atajo local (solo en buffers markdown) para no tener que
        -- acordarte de "gqap" a mano.
        vim.keymap.set("n", "<leader>mp", "gqap", {
            buffer = ev.buf,
            desc = "Pharagraph formatter (markdown, and latex)",
        })
        vim.keymap.set("n", "<leader>mf", "gggqG", {
            buffer = ev.buf,
            desc = "Formatear documento completo (markdown)",
        })
    end,
})

-- Grupo para which-key (solo aparece con contenido cuando estás en un
-- buffer markdown, ya que los keymaps de arriba son locales al buffer)
local ok, wk = pcall(require, "which-key")
if ok then
    wk.add {
        { "<leader>m", group = "Markdown and Latex" },
    }
end
