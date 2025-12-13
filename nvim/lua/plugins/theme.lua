return {
  -- 1. Disable the default TokyoNight theme
  { "folke/tokyonight.nvim", enabled = false },

  -- 2. Install Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- Ensure we are locked to Mocha
      transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = { enabled = true, indentscope_color = "" },
        -- Enable these so we can control their backgrounds
        mason = true,
        noice = true,
        snacks = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
      -- 3. THE MAGIC SECTION: Force Dark Backgrounds on UI Elements
      custom_highlights = function(colors)
        return {
          -- Status Line: distinct dark background
          StatusLine = { bg = colors.mantle },
          StatusLineNC = { bg = colors.mantle }, -- inactive status line

          -- Popups / Floating Windows: distinct dark background
          NormalFloat = { bg = colors.mantle },
          FloatBorder = { bg = colors.mantle, fg = colors.blue },

          -- Autocomplete Menu (cmp): distinct dark background
          Pmenu = { bg = colors.crust, fg = colors.text },
          PmenuSel = { bg = colors.surface0, fg = colors.text, style = { "bold" } },

          -- Lazy/Mason Windows
          LazyNormal = { bg = colors.mantle },
          MasonNormal = { bg = colors.mantle },
        }
      end,
    },
  },

  -- 4. Tell LazyVim to load Catppuccin by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
