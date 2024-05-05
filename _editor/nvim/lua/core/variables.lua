vim.opt.shiftwidth = 2
vim.g.mapleader = ' '

-- Nvim Tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.number = true

-- Fast Loader
vim.loader.enable()
-- vim.opt.relativenumber = true

vim.cmd([[
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
]])
