-- TITLE : nvim-lint
-- ABOUT : Linters setup tương tự efm nhưng qua nvim-lint
-- LINKS :
--   > https://github.com/mfussenegger/nvim-lint
-- ================================================================================================
return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			lua = { "luacheck" },
			sh = { "shellcheck" },
			docker = { "hadolint" },
			solidity = { "solhint" },
			css = { "stylelint" },
			html = { "htmlhint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			json = { "eslint_d" },
			jsonc = { "eslint_d" },
			svelte = { "eslint_d" },
			vue = { "eslint_d" },
			yaml = { "yamllint" },
			sql = { "sqlfluff" },
			markdown = { "markdownlint" },
			asm = { "wasm_language_tools" },
			vmasm = { "wasm_language_tools" },
		}
		-- Tự động lint khi save hoặc mở file
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
