-- Anywhere keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-q>", "<cmd> wq <CR>", opts)
vim.keymap.set("n", "<leader>x", "<cmd> q <CR>", opts)
vim.keymap.set("n", "<C-w>", "<cmd> w <CR>", opts)

vim.keymap.set("i", "kj", "<Esc>", opts)
vim.keymap.set("i", "jk", "<Esc>", opts)

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "<leader>v", "<C-w>v", opts)
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)
vim.keymap.set("n", "<leader>x", ":close<CR>", opts)

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<C-i>", "<C-i>", opts)
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts)

--Neotree keymaps
vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", { noremap = true, silent = true })
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

--LSP Config Keymaps
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)

vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition)

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

--Debugger Keymaps
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

-- None-ls Keymap
vim.keymap.set("n", "<C-s>", vim.lsp.buf.format)

-- SQL Key map
vim.keymap.set("n", "<leader>du", "<cmd>DBUIToggle<cr>", { desc = "Toggle Database UI" })

-- Run Code
vim.keymap.set("n", "<leader>-", function()
	local file = vim.fn.expand("%")
	local ext = vim.fn.expand("%:e")

	if ext == "py" then
		vim.cmd("split | terminal python " .. file)
	elseif ext == "c" then
		vim.cmd("split | terminal gcc " .. file .. " -o temp && ./temp")
	elseif ext == "cpp" then
		vim.cmd("split | terminal g++ " .. file .. " -o temp && ./temp")
	elseif ext == "js" then
		vim.cmd("split | terminal node " .. file)
	elseif ext == "ts" then
		vim.cmd("split | terminal ts-node " .. file)
	elseif ext == "php" then
		vim.cmd("split | terminal php " .. file)
	elseif ext == "html" then
		file = vim.fn.expand("%:t")
		local dir = vim.fn.expand("%:p:h")
		vim.fn.jobstart({ "live-server", dir, "--open=" .. file }, {
			detach = true,
		})
	end
	vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "Run current file" })
