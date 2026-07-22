-- Sets <leader>pv to Oil file explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")

-- LSP Mappings
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- LSP formatting
vim.keymap.set("n", "<leader>gf", function()
  vim.lsp.buf.format({
    async = false,
    filter = function(client)
      -- If stylua is attached, only use it
      if vim.lsp.get_clients({ name = "lua_ls", bufnr = 0 })[1] then
        return client.name == "lua_ls"
      end
      return client.name ~= "ts_ls"
    end,
  })
end, { desc = "LSP Format Buffer" })

-- Highlight when yanking text eg. yap(yank around paragraph)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
