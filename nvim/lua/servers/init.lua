local on_attach = require("utils.lsp").on_attach
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Language Server Protocol (LSP)
require("servers.lua_ls")(lspconfig, capabilities, on_attach)
require("servers.jsonls")(lspconfig, capabilities, on_attach)
require("servers.ts_ls")(lspconfig, capabilities, on_attach)
require("servers.bashls")(lspconfig, capabilities, on_attach)
require("servers.dockerls")(lspconfig, capabilities, on_attach)
require("servers.emmet_ls")(lspconfig, capabilities, on_attach)
require("servers.yamlls")(lspconfig, capabilities, on_attach)
require("servers.tailwindcss")(lspconfig, capabilities, on_attach)
require("servers.solidity_ls_nomicfoundation")(lspconfig, capabilities, on_attach)
require("servers.html_ls")(lspconfig, capabilities, on_attach)
require("servers.css_ls")(lspconfig, capabilities, on_attach)
require("servers.css-var")(lspconfig, capabilities, on_attach)
require("servers.marksman")(lspconfig, capabilities, on_attach)
require("servers.eslint-lsp")(lspconfig, capabilities, on_attach)
require("servers.asm_lsp")(lspconfig, capabilities, on_attach)

-- Linters & Formatters
