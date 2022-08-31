--     _       __  _       ___             __  _           
--    (_)___  / /_(_)___ _/ (_)___  ____ _/ /_(_)___  ____ 
--   / / __ \/ __/ / __ `/ / /_  / / __ `/ __/ / __ \/ __ \
--  / / / / / /_/ / /_/ / / / / /_/ /_/ / /_/ / /_/ / / / /
-- /_/_/ /_/\__/_/\__,_/_/_/ /___/\__,_/\__/_/\____/_/ /_/ 
--                                                         

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.conf",
	command = "setfiletype conf",
})

