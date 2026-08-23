vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

vim.cmd("packadd fzf-lua")

require("fzf-lua").setup({})
