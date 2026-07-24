return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"typescript",
			"html",
			"css",
			"json",
			"markdown",
			"markdown_inline",
			"vim",
			"vimdoc",
			"query",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}
