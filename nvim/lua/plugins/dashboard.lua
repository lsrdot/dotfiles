return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
      dashboard = {
        enabled = true,

        preset = {
          header = [[
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

      ------------------------------------------------------------------
      -- HARD ISOLATION LAYER (DOES NOT TOUCH GLOBAL HIGHLIGHTS)
      ------------------------------------------------------------------

      local ns = vim.api.nvim_create_namespace("snacks_dashboard_isolated")
      local fg = "#ffffff"

      local function apply_dashboard_hl(bufnr)
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return
        end

        -- buffer-local namespace application
        vim.api.nvim_buf_set_hl(bufnr, ns, "SnacksDashboardHeader", { fg = fg })
        vim.api.nvim_buf_set_hl(bufnr, ns, "SnacksDashboardKey", { fg = fg, bold = true })
        vim.api.nvim_buf_set_hl(bufnr, ns, "SnacksDashboardDesc", { fg = fg })
        vim.api.nvim_buf_set_hl(bufnr, ns, "SnacksDashboardIcon", { fg = fg })
        vim.api.nvim_buf_set_hl(bufnr, ns, "SnacksDashboardSpecial", { fg = fg })
      end

      ------------------------------------------------------------------
      -- APPLY ONLY WHEN DASHBOARD BUFFER APPEARS
      ------------------------------------------------------------------

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "snacks_dashboard",
        callback = function(ev)
          apply_dashboard_hl(ev.buf)
        end,
      })

      ------------------------------------------------------------------
      -- REAPPLY AFTER COLORSCHEME (STILL ISOLATED)
      ------------------------------------------------------------------

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then
              local ft = vim.bo[buf].filetype
              if ft == "snacks_dashboard" then
                apply_dashboard_hl(buf)
              end
            end
          end
        end,
      })
    end,
  },
}
