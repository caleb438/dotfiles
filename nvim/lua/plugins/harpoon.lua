return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon Add",
		},
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon Menu",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
		},
		{
			"<C-S-P>",
			function()
				require("harpoon"):list():prev()
			end,
		},
		{
			"<C-S-N>",
			function()
				require("harpoon"):list():next()
			end,
		},
	},

	config = function()
		require("harpoon"):setup()
	end,
}
