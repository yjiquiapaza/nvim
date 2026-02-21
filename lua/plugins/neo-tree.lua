return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencoes = {
        'nvim-lua/plenary.nvim',
        'nvim-mini/mini.icons',
        --"nvim-tree/nvim-web-devicons",
        'MunifTanjim/nui.nvim',
    },

    keys = {
        { "<leader>tn", ":Neotree filesystem<CR>", desc = "Open NeoTree node" },
        { "<leader>cn", ":Neotree close<CR>", desc = "Close NeoTree node" },
        { "<leader>gn", ":Neotree git_status<CR>", desc = "Open Git status NeoTree" },
    },
}
