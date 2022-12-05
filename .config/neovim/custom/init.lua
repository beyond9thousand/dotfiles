--     _       _ __  _       __
--    (_)___  (_) /_(_)___ _/ /____
--   / / __ \/ / __/ / __ `/ __/ _ \
--  / / / / / / /_/ / /_/ / /_/  __/
-- /_/_/ /_/_/\__/_/\__,_/\__/\___/
--

local autocmd = vim.api.nvim_create_autocmd
-- local usercmd = vim.api.nvim_create_user_command

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.conf",
	command = "setfiletype conf",
})

vim.opt.mousemodel = "extend"
