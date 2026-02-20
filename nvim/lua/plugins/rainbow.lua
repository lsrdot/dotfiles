return {

  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      local hl = vim.api.nvim_set_hl

      hl(0, "RainbowDelimiterRed", { fg = "#ff8f8a" })
      hl(0, "RainbowDelimiterYellow", { fg = "#ffd29c" })
      hl(0, "RainbowDelimiterBlue", { fg = "#a9d1ff" })
      hl(0, "RainbowDelimiterOrange", { fg = "#ffbe88" })
      hl(0, "RainbowDelimiterGreen", { fg = "#b4f5c6" })
      hl(0, "RainbowDelimiterViolet", { fg = "#d4b8ff" })
      hl(0, "RainbowDelimiterCyan", { fg = "#8fe9f2" })

      vim.g.rainbow_delimiters = {
        highlight = {
          "RainbowDelimiterBlue",
          "RainbowDelimiterCyan",
          "RainbowDelimiterViolet",
          "RainbowDelimiterGreen",
          "RainbowDelimiterYellow",
          "RainbowDelimiterRed",
        },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        highlight = {
          "RainbowDelimiterBlue",
          "RainbowDelimiterCyan",
          "RainbowDelimiterViolet",
          "RainbowDelimiterGreen",
          "RainbowDelimiterYellow",
          "RainbowDelimiterRed",
        },
      },
      scope = {
        highlight = {
          "RainbowDelimiterBlue",
          "RainbowDelimiterCyan",
          "RainbowDelimiterViolet",
          "RainbowDelimiterGreen",
          "RainbowDelimiterYellow",
          "RainbowDelimiterRed",
        },
      },
    },
  },
}
