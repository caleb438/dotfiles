return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Load early during startup
		opts = {
			flavour = "mocha", -- mocha, macchiato, frappe, latte
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
  }
}
