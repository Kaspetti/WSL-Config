return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup{}

      vim.keymap.set('n', '<S-H>', ':BufferLineCyclePrev <CR>', {
        noremap = true,
        silent = true,
        desc = "Bufferline: Cycle previous buffer"
      })

      vim.keymap.set('n', '<S-L>', ':BufferLineCycleNext <CR>', {
        noremap = true,
        silent = true,
        desc = "Bufferline: Cycle next buffer"
      })

      vim.keymap.set('n', '<C-H>', ':BufferLineMovePrev <CR>', {
        noremap = true,
        silent = true,
        desc = "Bufferline: Move prev buffer"
      })

      vim.keymap.set('n', '<C-L>', ':BufferLineMoveNext <CR>', {
        noremap = true,
        silent = true,
        desc = "Bufferline: Move next buffer"
      })

      vim.keymap.set('n', '<leader>q', ':BufferLinePickClose<CR>', {
        noremap = true,
        silent = true,
        desc = "Pick buffer to close"
      })
    end
  }
}
