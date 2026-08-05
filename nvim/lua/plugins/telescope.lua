return {
	{
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		cmd = "Telescope",
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files({ hidden = true })
				end,
				desc = "Telescope find files including hidden",
			},
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
			{ "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Telescope file diagnostics" },
			{
				"gd",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "Goto References",
			},
			{
				"gi",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gt",
				function()
					require("telescope.builtin").lsp_type_definitions()
				end,
				desc = "Goto Type Definition",
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				--file_ignore_patterns = {".cache", "local", ".cargo", ".cmake"},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
