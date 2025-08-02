return {
  {
     "goolord/alpha-nvim",
     config = function ()
         local alpha = require'alpha'
         local dashboard = require'alpha.themes.dashboard'
         dashboard.section.header.val = {
             [[                               __                ]],
             [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
             [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
             [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
             [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
             [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
         }
         dashboard.section.buttons.val = {
           dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
           dashboard.button( "SPC f f", " Find files",":Telescope find_files <CR>" ),
           dashboard.button( "SPC f h", "  Recently opened", ":Telescope oldfiles <CR>" ),
           dashboard.button( "SPC f r", "󰄉  Frecency/MRU", ":Telescope frecency <CR>" ),
           dashboard.button( "SPC s l", "󰑓  Open last session", ":SessionManager load_last_session <CR>" ),
           dashboard.button( "SPC s d", "  Open last session (dir)", ":SessionManager load_current_dir_session <CR>" ),
           dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
         }
         local fortune_str = ""
         local handle = io.popen('fortune -s')
         if handle then
           fortune_str = handle:read("*a")
           handle:close()
           fortune_str = fortune_str:gsub("^\n*", ""):gsub("\n*$", "")
           fortune_str = fortune_str:gsub("\n", " ")
         else
           fortune_str = "Fortune command not found or failed."
         end
         dashboard.section.footer.val = fortune_str

         dashboard.config.opts.noautocmd = true

         alpha.setup(dashboard.config)
     end
  }
}
