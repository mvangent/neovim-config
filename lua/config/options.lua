-- Neovim Options
-- All vim.opt settings are configured here

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.hlsearch = false
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "120"

-- Completion
opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
opt.shortmess:append("c")

-- Files
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Misc
opt.updatetime = 50
opt.isfname:append("@-@")
