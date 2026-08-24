-- ~/.config/nvim/lua/config/pack/treesitter.lua
--
-- Usa la API nueva de nvim-treesitter (rama "main"), no el
-- require("nvim-treesitter.configs").setup() viejo -- coincide con lo que
-- ya tenías, solo migrado de lazy.nvim a vim.pack.

vim.pack.add {
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
}

-- El bug de compilación de markdown/markdown_inline (LoadLibraryExW
-- failed) es específico de Windows -- es la API de carga de DLLs de
-- Windows fallando, no existe equivalente en Linux/macOS (ahí se cargan
-- .so vía dlopen, un mecanismo distinto). Por eso el workaround de acá
-- abajo solo se activa en Windows; en Unix estos dos parsers se instalan
-- normal, junto con el resto.
local is_windows = vim.fn.has "win32" == 1

local core_languages = {
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
    "markdown",
    "markdown_inline",
}

-- En Windows, sacamos markdown/markdown_inline de la lista auto-instalable
-- (fallan al compilar solos -- ver install-markdown-parsers.ps1 para
-- instalarlos a mano una vez por máquina). En Unix, la lista completa se
-- usa tal cual, sin distinción.
local auto_install_languages = core_languages
if is_windows then
    auto_install_languages = vim.tbl_filter(function(lang)
        return lang ~= "markdown" and lang ~= "markdown_inline"
    end, core_languages)
end

-- El autocmd de FileType siempre usa la lista completa -- en Windows,
-- markdown/markdown_inline ya están instalados a mano en site/parser/,
-- así que vim.treesitter.start() los encuentra igual.
local all_languages = core_languages

-- Usar zig como compilador de los parsers -- más simple que depender de
-- Visual Studio Build Tools en Windows, y es lo que recomienda la
-- comunidad para nvim-treesitter en este sistema. En Unix no hace falta,
-- pero no molesta dejarlo (nvim-treesitter cae a gcc/clang igual si zig
-- no está).
if is_windows then
    require("nvim-treesitter.install").compilers = { "zig" }
end

require("nvim-treesitter").install(auto_install_languages)

vim.api.nvim_create_autocmd("FileType", {
    pattern = all_languages,
    callback = function()
        vim.treesitter.start()
    end,
})

-- Nota sobre el `build = ":TSUpdate"` que tenías con lazy.nvim: ese hook
-- corría automáticamente después de instalar/actualizar el plugin.
-- vim.pack no tiene un `build` declarativo así -- pero como ya llamamos a
-- .install(languages) acá arriba en cada arranque, los parsers faltantes
-- se instalan solos igual. Si en algún momento querés forzar una
-- actualización de parsers ya instalados a la última versión, corré
-- :TSUpdate a mano después de actualizar el plugin con vim.pack.
