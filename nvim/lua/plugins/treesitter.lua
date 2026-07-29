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
			"bash",
			"cpp",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}
