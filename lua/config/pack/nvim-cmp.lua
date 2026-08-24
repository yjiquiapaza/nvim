-- ~/.config/nvim/lua/config/pack/nvim-cmp.lua
--
-- NOTA DE ORDEN: este archivo asume que "luasnip.lua" ya corrió antes
-- (instaló LuaSnip vía vim.pack y llamó a ls.setup()). Si tu init.lua
-- hace un require explícito archivo por archivo, poné luasnip.lua antes
-- que este. Si en cambio escanea la carpeta config/pack/ alfabéticamente,
-- el nombre "nvim-cmp.lua" ya ordena después de "luasnip.lua" (l < n),
-- así que no hace falta tocar nada.

vim.pack.add {
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/onsails/lspkind.nvim" },
}

local cmp = require "cmp"
local lspkind = require "lspkind"
local ls = require "luasnip" -- ya instalado/configurado por luasnip.lua

-- cmp_nvim_lsp es distinto a las otras fuentes: no tiene .new() porque
-- necesita una fuente separada por cada servidor de lenguaje que se
-- conecte. Su propio setup() se engancha a LspAttach y se registra solo.
require("cmp_nvim_lsp").setup()

-- buffer, path y luasnip NO se registran a mano acá -- resultó que
-- vim.pack sí sourcea automáticamente los plugin/*.lua de cada plugin
-- (que es donde cmp-buffer, cmp-path y cmp_luasnip se auto-registran
-- solos), así que hacerlo también acá los duplicaba.

-- Tab/S-Tab: si el menú de cmp está abierto, navega entre ítems; si no,
-- expande/salta snippets de LuaSnip; si tampoco, tab normal. Usamos Tab
-- en vez de combinaciones con Ctrl porque esas quedaban interceptadas
-- antes de llegarle a Neovim en este entorno.
vim.keymap.set("i", "<Tab>", function()
    if cmp.visible() then
        cmp.select_next_item()
    elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", false)
    end
end, { silent = true, desc = "Tab: cmp siguiente / expandir o saltar / tab normal" })

vim.keymap.set("i", "<S-Tab>", function()
    if cmp.visible() then
        cmp.select_prev_item()
    elseif ls.jumpable(-1) then
        ls.jump(-1)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n", false)
    end
end, { silent = true, desc = "S-Tab: cmp anterior / saltar atrás / tab normal" })

vim.keymap.set("s", "<Tab>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true, desc = "LuaSnip: expandir o saltar (modo select)" })

vim.keymap.set("s", "<S-Tab>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true, desc = "LuaSnip: saltar atrás (modo select)" })

cmp.setup {
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
        },
    },
}

-- gitcommit con cmp_git queda comentado: esa fuente necesita el plugin
-- "petertriho/cmp-git", que no está instalado. Si lo usás, agregá el src
-- arriba y descomentá:
--
-- cmp.setup.filetype("gitcommit", {
--     sources = cmp.config.sources {
--         { name = "cmp_git" },
--         { name = "buffer" },
--     },
-- })

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})
