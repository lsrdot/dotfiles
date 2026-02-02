return {
    {
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                enabled = true,

                -- Highlight group used by the header
                header_hl = "SnacksDashboardHeader",

                preset = {
                    header = [[
                                                                        
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                        
]],
          -- stylua: ignore
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
                },
            },
        },

        config = function(_, opts)
            require("snacks").setup(opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- break theme link
                    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {})

                    -- force your color
                    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {
                        fg = "#ffffff", -- change this freely
                    })

                    local fg = "#ffffff" -- SAME color as header

                    -- header
                    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = fg })

                    -- keys section (THIS is what you want)
                    vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = fg, bold = true })
                    vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = fg })
                    vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = fg })

                    -- optional but keeps everything consistent
                    vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = fg })
                end,
            })
        end,
    },
}
