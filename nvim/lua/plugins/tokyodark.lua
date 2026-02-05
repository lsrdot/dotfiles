return {
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      ------------------------------------------------------------------
      -- Background handling
      ------------------------------------------------------------------
      -- true  → transparent background (good for blur/compositors)
      -- false → solid background (default)
      --
      -- Cyberdream-style setups usually prefer transparency
      --
      transparent_background = true,

      ------------------------------------------------------------------
      -- Gamma / brightness
      ------------------------------------------------------------------
      -- Controls overall brightness curve of the theme
      --
      -- 1.00 → default contrast
      -- < 1  → darker, moodier
      -- > 1  → brighter, more washed
      --
      -- Cyberpunk / terminal-friendly sweet spot: 0.95–1.00
      --
      gamma = 0.95,

      ------------------------------------------------------------------
      -- Font styles
      ------------------------------------------------------------------
      styles = {
        -- Comments: italic gives subtle separation without color noise
        comments = { italic = true },

        -- Keywords: italic for flow clarity (if you like it)
        keywords = { italic = true },

        -- Identifiers (variables, symbols)
        -- Set italic = false if you want maximum sharpness
        identifiers = { italic = true },

        -- Functions: empty table = default styling
        functions = {},

        -- Variables: empty table = default styling
        variables = {},
      },

      ------------------------------------------------------------------
      -- Highlight overrides
      ------------------------------------------------------------------
      -- Extend or override specific highlight groups
      --
      -- You can use:
      -- 1) a table
      -- 2) a function(highlights, palette)
      --
      custom_highlights = function(highlights, palette)
        return {
          -- Examples (commented out by default):

          -- Make floating windows darker
          -- NormalFloat = { bg = palette.bg_dark },

          -- Subtle comments (Cyberdream-ish)
          -- Comment = { fg = palette.grey, italic = true },

          -- Stronger cursor line
          -- CursorLine = { bg = palette.bg_highlight },
        }
      end,

      ------------------------------------------------------------------
      -- Palette overrides
      ------------------------------------------------------------------
      -- Modify base colors used everywhere
      --
      -- Use this to:
      -- - deepen blacks
      -- - push accent colors
      -- - better match terminal / Ghostty colors
      --
      custom_palette = function(palette)
        return {
          -- Examples (commented out):

          -- Deeper background
          -- bg = "#030304",

          -- Slightly punchier accent
          -- blue = "#7aa2f7",

          -- Softer foreground
          -- fg = "#c8d3f5",
        }
      end,

      ------------------------------------------------------------------
      -- Terminal integration
      ------------------------------------------------------------------
      -- Applies Tokyodark palette to :terminal buffers
      --
      terminal_colors = true,
    },
    config = function(_, opts)
      require("tokyodark").setup(opts)
      vim.cmd([[colorscheme tokyodark]])
    end,
  },
}
