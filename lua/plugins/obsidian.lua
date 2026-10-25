return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "ReliqMind",
                path = "C:/Users/R3liq/code/ReliqMind",
            },
        },
        -- Optional, customize keymappings
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault
            ["gf"] = {
                action = function() return require("obsidian").util.gf_passthrough() end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes
            ["<leader>ch"] = {
                action = function() return require("obsidian").util.toggle_checkbox() end,
                opts = { buffer = true },
            },
        },
    },
    keys = {
        { "<leader>ms", "<cmd>ObsidianSearch<cr>",      desc = "Obsidian Search" },
        { "<leader>mq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian Quick Switch" },
        { "<leader>mn", "<cmd>ObsidianNew<cr>",         desc = "New Obsidian Note" },
    }
}
