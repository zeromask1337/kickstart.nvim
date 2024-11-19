local opt = vim.opt
local g = vim.g

-- Global options
g.mapleader = ' '
g.maplocalleader = ' '
g.have_nerd_font = false

-- Regular options
opt.number = true
opt.expandtab = true
opt.relativenumber = true
opt.mouse = 'a'
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split'
opt.cursorline = true
opt.scrolloff = 9999

-- Schedule clipboard setting
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

return {} -- Return empty table for consistency
