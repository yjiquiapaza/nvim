-- ~/.config/nvim/lua/config/pack/luasnip.lua
--
-- Solo LuaSnip acá -- instalación, setup, loaders de snippets, y el
-- keymap que es exclusivamente suyo (ciclar choice_node). Los keymaps
-- Tab/S-Tab (que combinan LuaSnip + cmp) viven en nvim-cmp.lua, porque
-- necesitan las dos cosas.
--
-- Los snippets propios en sí NO van acá -- viven en
-- ~/.config/nvim/luasnippets/markdown/*.lua (date.lua, litnote.lua, etc.),
-- cada uno con `return { s(...) }`.

vim.pack.add {
    { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.5.0" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
}

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.setup {
    history = true,
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    ext_base_prio = 300,
    ext_prio_increase = 1,
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    ft_func = function()
        return vim.split(vim.bo.filetype, ".", { plain = true })
    end,
}

-- Loader de tus snippets propios: ruta explícita, no depende del escaneo
-- automático de runtimepath (en Windows a veces falla). .load() en vez de
-- .lazy_load() porque el disparo perezoso por FileType no era confiable.
require("luasnip.loaders.from_lua").load {
    paths = vim.fn.stdpath "config" .. "/luasnippets",
}

-- friendly-snippets viene en formato VSCode -- necesita su propio loader.
require("luasnip.loaders.from_vscode").load()

-- Ciclar entre opciones de un choice_node (ninguno de tus snippets lo usa
-- todavía, pero queda listo para cuando agregues uno).
vim.keymap.set("i", "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true, desc = "LuaSnip: siguiente opción" })
