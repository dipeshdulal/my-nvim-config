local opt = vim.opt

-- leader key --
vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- options --
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.fillchars = { eob = " " }
opt.mouse = "a"

opt.number = true
opt.relativenumber = true

-- use clipboard register --
opt.clipboard = "unnamedplus"

-- highlight line
opt.cursorline = true

-- exrc
opt.exrc = true

