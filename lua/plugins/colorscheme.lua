return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- sets the specific dark theme you like
        transparent_background = false,
        term_colors = true,
      })

      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}
