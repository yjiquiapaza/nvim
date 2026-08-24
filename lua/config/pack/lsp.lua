-- ~/.config/nvim/lua/config/pack/lsp.lua (o donde corresponda en tu
-- estructura -- reemplaza al spec de lazy.nvim que declaraba
-- "hrsh7th/cmp-nvim-lsp" como plugin principal)
--
-- vim.pack.add() es seguro de llamar más de una vez con el mismo src
-- entre archivos distintos (no reinstala si ya está) -- lo repetimos acá
-- para que este archivo sea autosuficiente sin importar el orden de
-- carga respecto a nvim-cmp.lua.

vim.pack.add {
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/antosha417/nvim-lsp-file-operations" },
    { src = "https://github.com/folke/lazydev.nvim" },
}

-- Con lazy.nvim, `config = true` y `opts = {}` en el spec original hacían
-- que lazy llamara al .setup() por vos, automáticamente. vim.pack no
-- tiene ese azúcar sintáctico -- lo llamamos a mano.
require("lsp-file-operations").setup()
require("lazydev").setup()
-- Capabilities extendidas (soporte de snippets, documentación, etc.) que
-- le informan a cada servidor de lenguaje qué puede hacer el cliente.
-- Esto es lo que realmente conecta cmp-nvim-lsp con los servidores LSP.
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})
