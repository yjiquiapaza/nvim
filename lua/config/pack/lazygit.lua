vim.pack.add({
    { src = "https://github.com/kdheepak/lazygit.nvim" },
})

vim.cmd("packadd lazygit.nvim")

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
