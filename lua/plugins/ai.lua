return {
	{
		"folke/snacks.nvim",
		keys = {
			{
				"<leader>ta",
				function()
					Snacks.terminal.toggle("agy", {
						win = { position = "right", width = 80 },
					})
				end,
				desc = "Summon Antigravity",
			},
			{
				"<leader>to",
				function()
					Snacks.terminal.toggle("opencode", {
						win = { position = "right", width = 80 },
					})
				end,
				desc = "Summon OpenCode",
			},
			{
				"<leader>th",
				function()
					Snacks.terminal.toggle("hermes", {
						win = { position = "right", width = 80 },
					})
				end,
				desc = "Summon Hermes Agent",
			},
		},
	},
}
