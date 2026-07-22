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
    },
  },

  -- Fidget.nvim for LSP Progress status UI
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        display = {
          done_ttl = 3, -- How long completed messages stay on screen (seconds)
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
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
      "j-hui/fidget.nvim",
    },
    config = function()
      -- Define language servers and custom configurations
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              completion = { callSnippet = "Replace" },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
              diagnostics = { globals = { "vim" } },
              telemetry = { enable = false },
            },
          },
        },
        ts_ls = {},
        html = {},
        cssls = {},
        pyright = {},
        rust_analyzer = {},
        taplo = {
          filetypes = { "toml" },
        },
      }

      -- Get capabilities from blink.cmp
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Ensure Mason installs binaries
      local ensure_installed = {}
      for server, _ in pairs(servers) do
        table.insert(ensure_installed, server)
      end

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })

      -- Configure and enable servers using native Nvim 0.11+ API
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
