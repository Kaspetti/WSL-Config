local on_attach = function(client, bufnr)
  -- Quick access to Go commands
  vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {buffer=bufnr})
  vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', {buffer=bufnr})
  vim.keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {buffer=bufnr})
  
      -- Toggle gc_details
    vim.keymap.set('n', '<leader>goc', function()
      local file_path = vim.api.nvim_buf_get_name(0)
      -- Convert the path to a proper file:// URI
      local uri = vim.uri_from_fname(file_path)
      
      local params = {
        command = "gopls.gc_details",
        arguments = {uri}  -- Use the proper URI instead of raw path
      }
      
      local clients = vim.lsp.get_active_clients({bufnr = 0})
      for _, client in ipairs(clients) do
        if client.name == "gopls" then
          client.request("workspace/executeCommand", params, nil, 0)
          break
        end
      end
    end, {buffer=bufnr})
  
  -- Organize imports
  vim.keymap.set('n', '<leader>goi', function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.organizeImports" }
      },
    })
  end, {buffer=bufnr})
end

require("lspconfig").gopls.setup({
  on_attach = on_attach,
  settings = {
    gopls = {
      hints = {
        rangeVariableTypes = true,
        parameterNames = true,
        constantValues = true,
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        functionTypeParameters = true,
      },
      experimentalPostfixCompletions = true,
      codelenses = {
          gc_details = true,        -- Show gc optimizer details
          generate = true,          -- Show "Generate" buttons
          regenerate_cgo = true,    -- Show "Regenerate Cgo" buttons
          tidy = true,             -- Show "Run go mod tidy" buttons
          upgrade_dependency = true, -- Show "Upgrade dependency" buttons
          vendor = true,           -- Show "Add to vendor" buttons
      },
      analyses = {
        unusedparams = true,     -- Check for unused parameters
        shadow = true,           -- Check for shadowed variables
        nilness = true,          -- Check for potential nil pointer dereferences
        unusedwrite = true,      -- Check for unused writes
        useany = true,          -- Check for constraints that could be loosened to "any"
      },
      hoverKind = "FullDocumentation",
      usePlaceholders = true,
      -- Symbol matching settings
      symbolMatcher = "fuzzy",    -- Use fuzzy matching for symbols
      symbolStyle = "Dynamic", 
      
      -- Completion settings
      completeUnimported = true,  -- Show completions for packages that haven't been imported
      completionBudget = "1s",
      
      -- Diagnostic settings
      diagnosticsDelay = "500m",
    }
  }
})

