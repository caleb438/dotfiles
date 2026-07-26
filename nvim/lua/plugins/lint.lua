return {
	"mfussenegger/nvim-lint",

	event = {
		"BufReadPost",
		"BufWritePost",
		"InsertLeave",
	},

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff" },

			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },

			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },

			markdown = { "markdownlint" },

      bash = { "shellcheck" },
		}

		local lint_group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
		}, {
			group = lint_group,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
