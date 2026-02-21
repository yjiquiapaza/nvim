return {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = {
        { "<leader>h", ":HopWord<CR>", desc = "Hop Word" },
    },
    -- vim.api.nvim_set_keymap("n", "<space>h", ":HopWord<CR>", { noremap = true })
    config = function()
        require("hop").setup()
    end,
}
