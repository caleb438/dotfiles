---------------------------------
-- General
---------------------------------
local map = vim.keymap.set

---------------------------------
-- File Explorer
---------------------------------
map("n", "<leader>pv", "<cmd>Oil<CR>", {
	desc = "Open Oil",
})

---------------------------------
-- Editing
---------------------------------
map("v", "K", ":m '>-2<CR>gv=gv", {
	desc = "Move selection down",
})
map("v", "J", ":m '>+1<CR>gv=gv", {
	desc = "Move selection up",
})

---------------------------------
-- LSP Navigation
---------------------------------
map("n", "K", vim.lsp.buf.hover, {
	desc = "Hover Documentation",
})

map("n", "gD", vim.lsp.buf.declaration, {
	desc = "Go to Declaration",
})

---------------------------------
-- Code
---------------------------------
map("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code Action",
})

map("v", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code Action",
})

map("n", "<leader>cr", vim.lsp.buf.rename, {
	desc = "Rename Symbol",
})

---------------------------------
-- Diagnostics
---------------------------------
map("n", "<leader>de", vim.diagnostic.open_float, {
	desc = "Line Diagnostics",
})

map("n", "<leader>dq", vim.diagnostic.setloclist, {
	desc = "Diagnostics List",
})

map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, {
	desc = "Next Diagnostic",
})

map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, {
	desc = "Previous Diagnostic",
})

map("n", "<leader>di", function()
	vim.diagnostic.config({
		virtual_text = not vim.diagnostic.config().virtual_text,
	})
end, { desc = "Toggle inline diagnostics" })

map("n", "<leader>u", function()
  pcall(vim.cmd.packadd, "nvim.undotree")
  require("undotree").open()
end, { desc = "Toggle undotree" })

---------------------------------
-- Formatting
---------------------------------
map("n", "<leader>gf", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, {
	desc = "Format Buffer",
})

map("v", "<leader>gf", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, {
	desc = "Format Selection",
})

---------------------------------
-- Window Navigation
---------------------------------
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {
	desc = "Move focus to the left window",
})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {
	desc = "Move focus to the right window",
})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {
	desc = "Move focus to the lower window",
})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {
	desc = "Move focus to the upper window",
})

---------------------------------
-- Highlight on Yank
---------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
