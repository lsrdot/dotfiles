return {
    {
        "polirritmico/monokai-nightasty.nvim",
        lazy = false,
        priority = 1000,

        ------------------------------------------------------------------
        -- Theme options (FULL DEFAULTS)
        ------------------------------------------------------------------
        opts = {
            ------------------------------------------------------------------
            -- Background configuration
            ------------------------------------------------------------------
            dark_style_background = "transparent",
            light_style_background = "default",

            ------------------------------------------------------------------
            -- Highlight styles
            ------------------------------------------------------------------
            hl_styles = {
                comments = {
                    italic = true,
                },

                keywords = {
                    italic = false,
                },

                functions = {},
                variables = {},

                floats = "transparent",
                sidebars = "transparent",
            },

            ------------------------------------------------------------------
            -- Markdown / header features
            ------------------------------------------------------------------
            color_headers = true,
            markdown_header_marks = true,

            ------------------------------------------------------------------
            -- Window behavior
            ------------------------------------------------------------------
            dim_inactive = false,

            ------------------------------------------------------------------
            -- Lualine integration
            ------------------------------------------------------------------
            lualine_bold = true,
            lualine_style = "default",

            ------------------------------------------------------------------
            -- Terminal colors
            ------------------------------------------------------------------
            terminal_colors = false,

            ------------------------------------------------------------------
            -- Palette override hook
            ------------------------------------------------------------------
            on_colors = function(colors)
                -- no overrides
            end,

            ------------------------------------------------------------------
            -- Highlight override hook
            ------------------------------------------------------------------
            on_highlights = function(highlights, colors)
                -- intentionally empty
            end,

            ------------------------------------------------------------------
            -- Plugin integration
            ------------------------------------------------------------------
            auto_enable_plugins = true,

            plugins = {
                all = package.loaded.lazy == nil,
            },

            ------------------------------------------------------------------
            -- Cache
            ------------------------------------------------------------------
            cache = true,
        },

        ------------------------------------------------------------------
        -- Setup + load + persistent overrides
        ------------------------------------------------------------------
        config = function(_, opts)
            require("monokai-nightasty").setup(opts)
            require("monokai-nightasty").load()

            ------------------------------------------------------------------
            -- Persistent builtin / Treesitter overrides
            ------------------------------------------------------------------
            local function fix_js_builtins()
                vim.api.nvim_set_hl(0, "@variable.builtin", { link = "@method" })
                vim.api.nvim_set_hl(0, "@namespace.builtin", { link = "@method" })
                vim.api.nvim_set_hl(0, "@property", {
                    fg = "#ffffff",
                })
            end

            ------------------------------------------------------------------
            -- Tabline (top bar) colors
            ------------------------------------------------------------------
            local function fix_tabline()
                -- background of the whole bar
                vim.api.nvim_set_hl(0, "TabLineFill", {
                    bg = "#0d0d0d",
                })

                -- inactive tabs
                vim.api.nvim_set_hl(0, "TabLine", {
                    fg = "#75715e",
                    bg = "#0d0d0d",
                })

                -- active tab
                vim.api.nvim_set_hl(0, "TabLineSel", {
                    fg = "#f8f8f2",
                    bg = "#1c1c1c",
                    bold = true,
                })
            end

            ------------------------------------------------------------------
            -- Re-apply after colorscheme loads
            ------------------------------------------------------------------
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "monokai-nightasty",
                callback = function()
                    fix_js_builtins()
                    fix_tabline()
                end,
            })

            ------------------------------------------------------------------
            -- Re-apply after Treesitter / buffers attach
            ------------------------------------------------------------------
            vim.api.nvim_create_autocmd("FileType", {
                callback = fix_js_builtins,
            })
        end,
    },
}
