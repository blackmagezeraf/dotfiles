-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.opt
local g = vim.g

o.fileformat = "unix"

o.nu = true
o.ai = true

o.relativenumber = true

o.wrap = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = false
o.scrolloff = 8

o.autoindent = false

o.smartindent = false
o.wrapmargin = 80
o.textwidth = 80

o.swapfile = false
o.backup = false
o.undofile = true

o.encoding = "utf-8"
o.signcolumn = "yes"
o.colorcolumn = "81"

o.updatetime = 50

-- Global Settings
g.minianimate_disable = true
