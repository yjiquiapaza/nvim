return {
    "mhartington/formatter.nvim",
    keys = {
        { "<leader>p", ":Format<CR>", desc = "Formatter" },
        -- vim.api.nvim_set_keymap("n", "<space>p", ":Format<CR>", { noremap = true })
    },
    config = function()
        local util = require "formatter.util"
        require("formatter").setup {
            loggin = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = {
                    require("formatter.filetypes.lua").stylua(),
                },
                tex = {
                    require("formatter.filetypes.tex").latexindent(),
                },
                -- html = {
                -- 	function()
                -- 		return {
                -- 			exe = "npx prettier --write .",
                -- 		}
                -- 	end,
                -- }
                html = {
                    function()
                        return {
                            exe = "prettierd",
                            args = { vim.api.nvim_buf_get_name(0) },
                            stdin = true,
                        }
                    end,
                },
                astro = {
                    function()
                        return {
                            exe = "npx @biomejs/biome format --write ./src",
                        }
                    end,
                },
                javascript = {
                    require("formatter.filetypes.javascript").prettier(),
                },
                typescript = {
                    require("formatter.filetypes.typescript").prettier(),
                },
                vue = {
                    function()
                        return {
                            exe = "npm run format",
                        }
                    end,
                },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                },
                go = {
                    function()
                        return {
                            exe = "gofumpt -l -w",
                            arg = { vim.api.nvim_buf_get_name(0) },
                        }
                    end,
                    function()
                        return {
                            exe = "goimports-reviser -rm-unused -set-alias -format",
                            args = { vim.api.nvim_buf_get_name(0) },
                            stdin = true,
                        }
                    end,
                    function()
                        return {
                            exe = "golines",
                            args = { vim.api.nvim_buf_get_name(0), "-w" },
                        }
                    end,
                },
            },
        }
    end,
}
