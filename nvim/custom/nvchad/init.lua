local opt = vim.opt
local api = vim.api

-- line number
opt.number = true
opt.relativenumber = true

-- tab and indent
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- fold
opt.foldlevel = 99
opt.foldcolumn = "1"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = "getline(v:foldstart) . ' ... ' . substitute(getline(v:foldend), '^\\s*', '', '')"
opt.fillchars = { fold = " " }
api.nvim_set_hl(0, "Folded", { bg = "NONE", ctermbg = "NONE" })
