return {
  {
    'neovim/nvim-lspconfig',
  },

  {
    'mason-org/mason.nvim',
    opts = {}
  },

  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          enable = true,
          sign = false,
          virtual_text = true,
        },
      })

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
      map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
      map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
      map("n", "gy", "<cmd>Lspsaga peek_type_definition<CR>", opts)
      map("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
      map("n", "dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      map("n", "dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      map("n", "<leader>do", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
      map("n", "<leader>dd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
      map("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
      map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
      map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
      map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
      map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
      map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
      map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
      map("n", "<leader>ft", "<cmd>Lspsaga term_toggle<CR>", opts)
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  },

  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          -- Keymap for navigating snippets
          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }), -- "i" for insert mode, "s" for select mode (snippets)
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- For LSP suggestions
          { name = 'luasnip' },  -- For snippet suggestions
          { name = 'buffer' },   -- For words from the current buffer
          { name = 'path' },     -- For file paths
        }),
        -- (Optional) Add formatting for completion items with icons
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s", vim_item.kind)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snp]",
                    buffer = "[Buf]",
                    path = "[Pth]",
                })[entry.source.name]
                return vim_item
            end,
        },
      })

      -- Setup nvim-cmp for command line mode
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },
}
