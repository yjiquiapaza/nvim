return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
    opts = {
        focus = true,
    },
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
        { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR><CR>", desc = "Open trouble document diagnostics" },
        { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
        { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
    },
}
