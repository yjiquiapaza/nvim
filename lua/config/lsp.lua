--vim.lsp.enable "lua_ls"
local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Show definition, references
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)

        -- Show lsp declaration
        opts.desc = "Show LSP definition"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        -- Show lsp definition
        opts.desc = "Show LSP definition"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        -- Show lsp implementation
        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)

        -- Show diagnostic for line
        opts.desc = "Show line diagnostic"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        -- Show documentation for what is under cursor
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
})

-- vim.lsp.inlay_hint.enable(true)

local severity = vim.diagnostic.severity

vim.diagnostic.config {
    virtual_text = {
        prefix = "●", -- can be a string or a function
        spacing = 2,
    },
    signs = {
        text = {
            [severity.ERROR] = " ",
            [severity.WARN] = " ",
            [severity.HINT] = "󰠠 ",
            [severity.INFO] = " ",
        },
    },
}
