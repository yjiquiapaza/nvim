return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup {
            chunk = {
                enable = true,
                use_treesitter = true,
                style = {
                    { fg = "#806d9c" },
                    { fg = "#c21f30" },
                },
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = ">",
                },
                textobject = "ic",
                duration = 200,
                delay = 300,
            },
            indent = {
                enable = true,
                use_treesitter = false,
                chars = { "│" },
            },
            line_num = {
                enable = false,
            },
            blank = {
                enable = false,
            },
        }
    end,
}
