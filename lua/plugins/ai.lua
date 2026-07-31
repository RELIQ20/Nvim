return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("codecompanion").setup({
      -- We will set Gemini Pro as the default for heavy lifting,
      -- but you can change these to "ollama" if you want to default to local.
      strategies = {
        chat = { adapter = "gemini" },
        inline = { adapter = "ollama" }, -- Example: Use local Qwen for fast inline edits!
        agent = { adapter = "gemini" },
      },

      adapters = {
        -- 1. The Gemini Pro Configuration
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "GEMINI_API_KEY",
            },
            schema = {
              model = {
                default = "gemini-1.5-pro",
              },
            },
          })
        end, -- 2. Your Local Ollama Configuration
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "http://127.0.0.1:11434" -- Default Ollama port on Windows
            },
            schema = {
              model = {
                -- Pointing directly to your installed Qwen Coder model
                default = "qwen2.5-coder:7b",
              },
            },
          })
        end,
      },
    })
  end,
  keys = {
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>",     desc = "CodeCompanion Actions", mode = { "n", "v" } },
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat",           mode = { "n", "v" } },
    { "ga",         "<cmd>CodeCompanionChat Add<cr>",    desc = "Add code to Chat",      mode = "v" },
    { "<leader>ce", "<cmd>CodeCompanion<cr>",            desc = "Inline Code Edit",      mode = { "n", "v" } },
  },
}
