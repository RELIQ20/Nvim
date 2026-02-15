return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      auto_integrations = true,
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
