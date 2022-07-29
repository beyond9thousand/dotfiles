local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.conf",
	command = "setfiletype conf",
})
