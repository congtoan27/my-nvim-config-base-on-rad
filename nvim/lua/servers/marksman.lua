return function(lspconfig, capabilities, on_attach)
	lspconfig.marksman.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "markdown", "markdown.mdx" },
	})
end
