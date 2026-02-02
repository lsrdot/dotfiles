return {
    {
        "akinsho/bufferline.nvim",
        opts = {},
        config = function()
            require("bufferline").setup({
                highlights = {
                    fill = { bg = "NONE" },
                    background = { bg = "NONE", fg = "#6c5eb5" },
                    buffer_visible = { bg = "NONE", fg = "#7869c4" },
                    buffer_selected = { bg = "NONE", fg = "#a5a5ff", bold = true, italic = false },
                    separator = { bg = "NONE", fg = "#50459b" },
                    separator_selected = { bg = "NONE", fg = "#50459b" },
                    separator_visible = { bg = "NONE", fg = "#50459b" },
                    close_button = { bg = "NONE", fg = "#6c5eb5" },
                    close_button_visible = { bg = "NONE", fg = "#7869c4" },
                    close_button_selected = { bg = "NONE", fg = "#a5a5ff" },
                    tab = { bg = "NONE", fg = "#6c5eb5" },
                    tab_selected = { bg = "NONE", fg = "#a5a5ff", bold = true },
                    tab_separator = { bg = "NONE", fg = "#50459b" },
                    tab_separator_selected = { bg = "NONE", fg = "#50459b" },
                },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {},
        config = function()
            require("lualine").setup({
                options = {
                    theme = {
                        normal = {
                            a = { bg = "NONE", fg = "#7869c4", gui = "bold" },
                            b = { bg = "NONE", fg = "#7869c4" },
                            c = { bg = "NONE", fg = "#6c5eb5" },
                        },
                        insert = {
                            a = { bg = "NONE", fg = "#6abfc6", gui = "bold" },
                            b = { bg = "NONE", fg = "#6abfc6" },
                            c = { bg = "NONE", fg = "#6c5eb5" },
                        },
                        visual = {
                            a = { bg = "NONE", fg = "#a057a3", gui = "bold" },
                            b = { bg = "NONE", fg = "#a057a3" },
                            c = { bg = "NONE", fg = "#6c5eb5" },
                        },
                        command = {
                            a = { bg = "NONE", fg = "#887ecb", gui = "bold" },
                            b = { bg = "NONE", fg = "#887ecb" },
                            c = { bg = "NONE", fg = "#6c5eb5" },
                        },
                        replace = {
                            a = { bg = "NONE", fg = "#9f4e44", gui = "bold" },
                            b = { bg = "NONE", fg = "#9f4e44" },
                            c = { bg = "NONE", fg = "#6c5eb5" },
                        },
                    },
                },
            })

            -- Override highlight groups directly
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#7869c4" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#6c5eb5" })

            -- Current line and visual selection
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3d3199" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#a5a5ff", bold = true, bg = "NONE" })
            vim.api.nvim_set_hl(0, "Visual", { bg = "#50459b", fg = "#c9d1e2" })

            -- Override tabline/winbar transparency
            vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE", fg = "#6c5eb5" })
            vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE", fg = "#a5a5ff", bold = true })
            vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE", fg = "#7869c4" })
            vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE", fg = "#6c5eb5" })

            vim.opt.cursorline = true
        end,
    },
}
