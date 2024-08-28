vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Movement keys while in insert mode
vim.keymap.set('i', '<C-J>', '<Down>')
vim.keymap.set('i', '<C-K>', '<Up>')
vim.keymap.set('i', '<C-H>', '<Left>')
vim.keymap.set('i', '<C-L>', '<Right>')

 vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true }) 
