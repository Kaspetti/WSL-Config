vim.opt.nu = true;
vim.opt.relativenumber = true;

vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;
vim.opt.smartindent = true;

vim.opt.wrap = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.termguicolors = true;

vim.opt.nu = true;
vim.opt.relativenumber = true;

vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true
vim.opt.smartindent = true;

vim.opt.wrap = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.termguicolors = true;

vim.opt.clipboard = "unnamedplus";

vim.api.nvim_command('filetype plugin on')
vim.api.nvim_command('filetype indent on')

-- vim.g.clipboard = {
--     name = "win32yank-wsl",
--     copy = {
--          ["+"] = "win32yank.exe -i --crlf",
--          ["*"] = "win32yank.exe -i --crlf"
--     },
--     paste = {
--         ["+"] = "win32yank.exe -o --lf",
--         ["*"] = "win32yank.exe -o --lf"
--     },
--     cache_enabled = false
-- }
