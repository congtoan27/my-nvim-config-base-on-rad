return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			-- Conform will run the first available formatter
			go = { "gofumpt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			sh = { "shfmt" },
			json = { "fixjson" },
			jsonc = { "fixjson" },
			markdown = { "mardownlint" },
			css = { "prettierd" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
			svelte = { "prettierd" },
			docker = { "prettierd" },
			solidity = { "prettierd" },
			cs = { "csharpier" },
			sql = { "sqlfmt" },
			yaml = { "yamlfmt" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
