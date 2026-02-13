return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,

    config = function()
      require("github-theme").setup({

        options = {
          -- Where compiled theme cache is stored
          compile_path = vim.fn.stdpath("cache") .. "/github-theme",

          -- Suffix for compiled file
          compile_file_suffix = "_compiled",

          -- true = hide "~" at end of buffer
          -- false = show "~"
          hide_end_of_buffer = true,

          -- true = remove underline from inactive statuslines
          hide_nc_statusline = true,

          -- true = no background (transparent terminal)
          -- false = theme controls background
          transparent = true,

          -- true = sets vim.g.terminal_color_*
          -- false = does not override terminal colors
          terminal_colors = true,

          -- true = dim non-focused splits
          -- false = normal background everywhere
          dim_inactive = false,

          -- true = all supported plugin modules enabled by default
          -- false = you must enable modules manually
          module_default = true,

          styles = {
            -- Valid values:
            -- "NONE"
            -- "bold"
            -- "italic"
            -- "underline"
            -- "undercurl"
            -- "underdouble"
            -- "underdotted"
            -- "underdashed"
            -- "strikethrough"
            -- "reverse"
            -- "standout"
            -- Or combine like:
            -- "italic,bold"

            comments = "italic", -- Comment text
            functions = "NONE", -- Function names
            keywords = "NONE", -- if, for, return, etc
            variables = "NONE", -- Variable identifiers
            conditionals = "NONE", -- if/else blocks
            constants = "NONE", -- Constant values
            numbers = "NONE", -- Numeric literals
            operators = "NONE", -- + - * / etc
            strings = "NONE", -- String literals
            types = "NONE", -- Type names
          },

          inverse = {
            -- true = invert fg/bg
            -- false = normal
            match_paren = false,
            visual = false,
            search = false,
          },

          darken = {
            -- true = darker floating windows
            floats = true,

            sidebars = {
              enable = true, -- darker sidebar windows
              list = {
                -- Add filetypes here if you want
                -- "neo-tree",
                -- "terminal",
                -- "packer",
              },
            },
          },

          modules = {
            -- Modules are plugin integrations.
            -- If module_default = true, they auto-enable.
            --
            -- Example manual control:
            -- gitsigns = true,
            -- telescope = true,
            -- treesitter = true,
            -- lsp = true,
            -- cmp = true,
          },
        },

        palettes = {
          -- Override base colors here if desired
          -- Example:
          -- all = {
          --   red = "#ff0000",
          -- }
        },

        specs = {
          -- Override logical color mappings here
        },

        groups = {
          -- Override raw highlight groups here
          -- Example:
          -- Normal = { bg = "#000000" },
        },
      })

      -- Change this to whichever variant you want
      vim.cmd("colorscheme github_dark")
    end,
  },
}
