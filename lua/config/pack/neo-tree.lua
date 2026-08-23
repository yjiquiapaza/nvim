vim.pack.add {
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "3.0" },
}
-- remove this line, when change SO for example linux
vim.cmd("packadd neo-tree.nvim")

require("neo-tree").setup {
    default_component_configs = {
        git_status = {
            symbols = {
                added = "✚",
                deleted = "✖",
                renamed = "➜",
                modified = "●",
                untracked = "?",
                ignored = "◌",
                unstaged = "○",
                staged = "✓",
                conflict = "✗",
            },
        },
    },
}

vim.keymap.set("n", "<leader>tn", ":Neotree filesystem<CR>", { desc = "Open NeoTree node" })
vim.keymap.set("n", "<leader>cn", ":Neotree close<CR>", { desc = "Close NeoTree node" })
vim.keymap.set("n", "<leader>gn", ":Neotree git_status<CR>", { desc = "Open Git status NeoTree" })
