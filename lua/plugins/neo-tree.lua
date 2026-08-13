return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencoes = {
        "nvim-lua/plenary.nvim",
        "nvim-mini/mini.icons",
        --"nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
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
    },
    keys = {
        { "<leader>tn", ":Neotree filesystem<CR>", desc = "Open NeoTree node" },
        { "<leader>cn", ":Neotree close<CR>", desc = "Close NeoTree node" },
        { "<leader>gn", ":Neotree git_status<CR>", desc = "Open Git status NeoTree" },
    },
}
