require("config.lazy")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local lsp_utils = require("utils.lsp")
vim.lsp.config("*", {
	on_attach = lsp_utils.on_attach,
	capabilities = lsp_utils.capabilities,
})
local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	},
	kulala_ls = {},
	yamlls = {},
	docker_language_server = {},
	jsonls = {},
	ts_ls = {},
	solidity_ls_nomicfoundation = {},
	cssls = {

		filetypes = { "css", "scss", "less", "razor", "cshtml", "javascriptreact", "typescriptreact" },
	},
	css_variables = {

		filetypes = {
			"astro",
			"css",
			"eruby",
			"html",
			"htmlangular",
			"htmldjango",
			"javascriptreact",
			"less",
			"pug",
			"sass",
			"scss",
			"svelte",
			"templ",
			"typescriptreact",
			"vue",
			"razor",
			"cshtml",
		},
	},
	tailwindcss = {},
	html = {

		filetypes = {
			"astro",
			"css",
			"eruby",
			"html",
			"htmlangular",
			"htmldjango",
			"javascriptreact",
			"less",
			"pug",
			"sass",
			"scss",
			"svelte",
			"templ",
			"typescriptreact",
			"vue",
			"razor",
			"cshtml",
		},
	},
	bashls = {},
	wasm_language_tools = {},
	postgres_lsp = {},
	stylua = {},
	emmet_ls = {

		filetypes = {
			"astro",
			"css",
			"eruby",
			"html",
			"htmlangular",
			"htmldjango",
			"javascriptreact",
			"less",
			"pug",
			"sass",
			"scss",
			"svelte",
			"templ",
			"typescriptreact",
			"vue",
			"razor",
			"cshtml",
		},
	},
}

for name, conf in pairs(servers) do
	vim.lsp.config[name] = conf
	vim.lsp.enable(name)
end

-- utils
local function format_with_rzls(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(client)
			return client.name == "rzls"
		end,
	})
end

-- autocmd
local augroup = vim.api.nvim_create_augroup("RazorFormat", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePre" }, {
	group = augroup,
	pattern = { "*.razor", "*.cshtml" },
	callback = function(args)
		format_with_rzls(args.buf)
	end,
})
