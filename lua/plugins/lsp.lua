return {
  -- 1. Mason (The Installer)
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- 2. Mason LSP Config (The Bridge)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ts_ls",
        "emmet_ls",
        "cssls",
        "html",
        "lua_ls",
        "rust_analyzer",
        "pylsp",
      },
      -- THIS IS THE FIX: Move all setups into 'handlers'
      handlers = {
        -- The default handler: Applies to every server without a specific custom handler
        function(server_name)
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- Specific Handler for Lua (Moved from your manual config)
        ["lua_ls"] = function()
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
        end,

        -- Specific Handler for Python (pylsp) (Moved from your manual config)
        ["pylsp"] = function()
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig").pylsp.setup({
            capabilities = capabilities,
            settings = {
              pylsp = {
                plugins = {
                  pyflakes = { enabled = false },
                  pycodestyle = { enabled = false },
                  ruff = { enabled = true },
                  black = { enabled = true },
                  pylint = { enabled = false },
                  autopep8 = { enabled = false },
                  yapf = { enabled = false },
                  pylsp_mypy = { enabled = false },
                  mccabe = { enabled = false },
                  isort = { enabled = false },
                },
              },
            },
          })
        end,

        -- Explicitly disable pyright if you are using pylsp instead
        ["pyright"] = function() end,
      },
    },
  },

  -- 3. LSP Config (The Core) - No config needed here, Mason handles it!
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
}
