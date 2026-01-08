return {
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      ---@usage 'background'|'foreground'|'virtualtext'
      render = "virtualtext", -- Use virtualtext to keep it minimal and "ricey"
      enable_named_colors = true,
      enable_tailwind = true,
      virtual_symbol = "■", -- The icon that will show the color
    },
  },
}
