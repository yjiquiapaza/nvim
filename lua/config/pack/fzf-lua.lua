vim.pack.add {
    { src = "https://github.com/ibhagwan/fzf-lua" },
}

vim.cmd "packadd fzf-lua"

require("fzf-lua").setup {}

vim.keymap.set("n", "<leader>xx", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Diagnostics (workspace)" })
vim.keymap.set("n", "<leader>xd", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Diagnostics (current file)" })
vim.keymap.set("n", "<leader>xq", "<cmd>FzfLua quickfix<CR>", { desc = "Quickfix list" })
vim.keymap.set("n", "<leader>xl", "<cmd>FzfLua loclist<CR>", { desc = "Location list" })
