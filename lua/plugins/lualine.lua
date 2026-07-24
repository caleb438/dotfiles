return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			-- theme = require("catppuccin.utils.lualine")("mocha"),
			theme = "nord",
			icons_enabled = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
	},
}
