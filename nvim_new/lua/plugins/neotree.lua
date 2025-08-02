return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- Close Neo-tree if it's the last window
        popup_border_style = "rounded",
      })

      vim.keymap.set('n', '<leader>e', ':Neotree reveal<CR>', {
        noremap = true,
        silent = true,
        desc = "Neo-tree: Reveal current file"
      })

      vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', {
        noremap = true,
        silent = true,
        desc = "Neo-tree: Toggle Neotree"
      })
    end
  }
}
