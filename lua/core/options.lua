vim.g.mapleader = " "
vim.g.snippets = "luasnip"

local opt = vim.opt

--opt.mouse = false
opt.number = true
opt.relativenumber = true
opt.conceallevel = 3
opt.hidden = true
opt.expandtab = true
--opt.tapstop = 4
opt.softtabstop = 4
--opt.shifindent = true
opt.errorbells = false
opt.wrap = false
opt.swapfile = false
opt.undofile = true
--opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.showmode = false
opt.clipboard = "unnamed,unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.autowrite = true
opt.list = true
--opt.listchars = "tab:
opt.laststatus = 3
opt.cmdheight = 1
opt.updatetime = 50
opt.signcolumn = "yes"

opt.cursorline = true

opt.mousemoveevent = true

