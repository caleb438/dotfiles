return {
	-- Mason for LSP package management
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	-- Blink.cmp for completion
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = { preset = "super-tab" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },
		},
	},

  -- LuaSnip as snippet engine and friendly-snippets to provide snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

	-- Fidget.nvim for LSP Progress status UI
	{
		"j-hui/fidget.nvim",
		opts = {
			progress = {
				display = {
					done_ttl = 2, -- How long completed messages stay on screen (seconds)
				},
			},
			notification = {
				window = {
					winblend = 0, -- transparent/solid background support
				},
			},
		},
	},

	-- LSP config and Mason
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp",
			"j-hui/fidget.nvim",
		},
		config = function()
			-- Get capabilities from blink.cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Define language servers and custom configurations
			local servers = {
				lua_ls = {
					capabilities = capabilities,
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							workspace = {
								checkThirdParty = false,
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = { enable = false },
						},
					},
				},
				basedpyright = { capabilities = capabilities },
				vtsls = { capabilities = capabilities },
				html = { capabilities = capabilities },
				cssls = { capabilities = capabilities },
				rust_analyzer = { capabilities = capabilities },
				taplo = {
					filetypes = { "toml" },
					capabilities = capabilities,
				},
			}
      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
		end,
	},
}
