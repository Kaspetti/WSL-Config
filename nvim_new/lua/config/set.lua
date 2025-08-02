vim.opt.nu = true;
vim.opt.relativenumber = true;

vim.opt.signcolumn = 'yes:1'

vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;
vim.opt.smartindent = true;

vim.opt.wrap = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.termguicolors = true;

vim.opt.clipboard = "unnamedplus";

vim.api.nvim_command('filetype plugin on')
vim.api.nvim_command('filetype indent on')

vim.g.python3_host_prog = vim.fn.expand('~/.config/nvim/pynvim-venv/bin/python')
