return {
  { 
    "olacin/telescope-cc.nvim",
    config = function() 
      local function create_conventional_commit()
        local actions = require("telescope._extensions.conventional_commits.actions")
        local picker = require("telescope._extensions.conventional_commits.picker")
        local themes = require("telescope.themes")

        -- if you use the picker directly you have to provide your theme manually
        local opts = {
          action = actions.prompt,
          include_body_and_footer = true,
        }
        opts = vim.tbl_extend("force", opts, themes["get_ivy"]())
        picker(opts)
      end

      vim.keymap.set(
        "n",
        "cc",
        create_conventional_commit,
        { desc = "Create conventional commit" }
      )
    end
  }
}
