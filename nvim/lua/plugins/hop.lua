return {
    {
        'smoka7/hop.nvim',
        version = "*",
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            vim.api.nvim_set_keymap('n', 's', "<cmd>HopChar1<cr>", {})
            vim.api.nvim_set_keymap('n', 'S', "<cmd>HopChar2<cr>", {})
            vim.api.nvim_set_keymap('n', 'W', "<cmd>HopWord<cr>", {})
            vim.api.nvim_set_keymap('n', 'f', "<cmd>HopPattern<cr>", {})
            vim.api.nvim_set_keymap('n', 'L', "<cmd>HopLine<cr>", {})
            vim.api.nvim_set_keymap('v', 's', "<cmd>HopChar1<cr>", {})
            vim.api.nvim_set_keymap('v', 'S', "<cmd>HopChar2<cr>", {})
            vim.api.nvim_set_keymap('v', 'W', "<cmd>HopWord<cr>", {})
            vim.api.nvim_set_keymap('v', 'L', "<cmd>HopLine<cr>", {})
        end
    }
}
