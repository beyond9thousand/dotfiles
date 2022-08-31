local M = {}

local override = require("custom.override")

M.ui = {
	theme = "tokyonight",
}

M.plugins = {

	override = {
		["williamboman/mason.nvim"] = override.mason,
    ["williamboman/mason-lspconfig.nvim"] = override.mason_lspconfig,
	},

	user = require("custom.plugins"),
}

return M
