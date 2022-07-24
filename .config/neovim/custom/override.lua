-- overriding default plugin configs!

local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"html",
		"css",
		"javascript",
		"json",
		"toml",
		"c",
		"bash",
		"lua",
		"norg",
	},

	auto_install = true,
}

return M
