-- Sets <leader>pv to file explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>")


-- Highlight when yanking text eg. yap(yank around paragraph)
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
