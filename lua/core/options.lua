vim.g.mapleader = " "
vim.g.snippets = "luasnip"

local opt = vim.opt

-- NORNMAL BEHAVIOR

opt.mousemoveevent = true
opt.hidden = true
opt.errorbells = false
opt.autowrite = true
opt.autoread = true
opt.clipboard = "unnamed,unnamedplus"
opt.timeoutlen = 400

-- IDENTATION

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true

-- SEARCH

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- FILE, UNDO, AND BACKUPS

opt.swapfile = false
opt.undofile = true

-- INTERFACE

opt.number = true
opt.relativenumber = true
opt.conceallevel = 3
opt.wrap = false
opt.termguicolors = true
opt.scrolloff = 4
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.laststatus = 3
opt.cmdheight = 1
opt.updatetime = 50
opt.signcolumn = "yes"
opt.cursorline = true
opt.pumheight = 12

opt.list =true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", extends = "›", precedes = "‹" }
-- CURSOR

vim.api.nvim_set_hl(0, "Cursor", { bg = "#bb9af7" })
opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20,o:hor50"

vim.opt.completeopt = { "menu", "menuone", "noselect" }
