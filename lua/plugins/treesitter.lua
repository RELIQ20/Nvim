return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- Pins the plugin to the legacy branch that supports configs
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua", "python", "javascript", "typescript", "tsx",
      "html", "css", "json", "bash", "markdown",
      "gitignore", "cpp", "c"
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
