return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("cyberdream").setup({

        variant = "default",

        transparent = true,

        saturation = 0.55,

        hide_fillchars = true,

        borderless_pickers = false,

        terminal_colors = true,

        italic_comments = true,

        cache = false,

        highlights = {},

        overrides = function(colors)
          return {}
        end,

        colors = {},

        extensions = {
          telescope = true,
          notify = true,
          mini = true,
        },
      })

      vim.cmd("colorscheme cyberdream")
    end,
  },
}
