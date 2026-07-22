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
    keys = {
      {
        "<leader>ff",
        ":lua require'telescope.builtin'.find_files({hidden=true})<CR>",
        desc = "Telescope find files including hidden",
      },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",   desc = "Telescope buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
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
