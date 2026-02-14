return {
  -- 1. Configure LSPs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable tsserver to use vtsls instead
        tsserver = { enabled = false },
        vtsls = {},
        prismals = {},
        tailwindcss = {},
        html = {},
        cssls = {},
      },
    },
  },

  -- 2. Configure Fast Linting/Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
      },
    },
  },
}
