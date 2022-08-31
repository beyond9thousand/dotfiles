local present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present then
	return
end

local M = {}

M.setup = function()
	mason_lspconfig.setup({
		ensure_installed = { "sumneko_lua", "bashls" },
	})
end

return M
