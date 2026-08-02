return {
	{
		dir = vim.fn.expand("~/projects/petrol.nvim"),
		name = "petrol.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			styles = {
				comments = { italic = true },
				keywords = { bold = true },
				functions = { italic = false, bold = true },
			},
		},
		config = function(_, opts)
			require("petrol").setup(opts)
			vim.cmd.colorscheme("petrol")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = {
			flavour = "mocha",
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		lazy = true,
	},
}
