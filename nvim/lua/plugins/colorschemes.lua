return {
	{
		dir = vim.fn.expand("~/projects/petrol.nvim"),
		name = "petrol.nvim",
		lazy = false,
		priority = 1000,

		config = function()
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
