return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local header = [[
                                                                                                   Z 
                                                                                                Z    
                                                                                            z        
             ███████████            █████              █████   █████  ███                 z          
            ▒▒███▒▒▒▒▒███          ▒▒███              ▒▒███   ▒▒███  ▒▒▒  [ 【-】◡ 【-】]            
             ▒███    ▒███   ██████  ▒███████   ██████  ▒███    ▒███  ████  █████████████             
             ▒██████████   ███▒▒███ ▒███▒▒███ ███▒▒███ ▒███    ▒███ ▒▒███ ▒▒███▒▒███▒▒███            
             ▒███▒▒▒▒▒███ ▒███ ▒███ ▒███ ▒███▒███ ▒███ ▒▒███   ███   ▒███  ▒███ ▒███ ▒███            
             ▒███    ▒███ ▒███ ▒███ ▒███ ▒███▒███ ▒███  ▒▒▒█████▒    ▒███  ▒███ ▒███ ▒███            
             █████   █████▒▒██████  ████████ ▒▒██████     ▒▒███      █████ █████▒███ █████           
            ▒▒▒▒▒   ▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒       ▒▒▒      ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒            
                                                                                         
                                                                                         
      ]]

    header = string.rep("\n", 6) .. header .. "\n\n 💤 Based on LazyVim 💤\n"

    return {
      theme = "doom",
      config = {
        hide = {
          statusline = false,
        },

        header = vim.split(header, "\n"),

        center = {
          { action = "lua LazyVim.pick()()", desc = " Find File", icon = " ", key = "f" },
          { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()', desc = " Recent Files", icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()', desc = " Find Text", icon = " ", key = "g" },
          { action = "lua LazyVim.pick.config_files()()", desc = " Config", icon = " ", key = "c" },
          { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
          { action = "Lazy", desc = " Plugin Manager", icon = "󰒲 ", key = "l" },
          {
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            desc = " Quit",
            icon = " ",
            key = "q",
          },
        },

        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ RoboVim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }
  end,
}
