local mason_registry = require "mason-registry"
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
    .. "/node_modules/@vue/language_server"

return {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                language = { "vue" },
            },
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
    },
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}
