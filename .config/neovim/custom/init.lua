--     _       _ __  _       __
--    (_)___  (_) /_(_)___ _/ /____
--   / / __ \/ / __/ / __ `/ __/ _ \
--  / / / / / / /_/ / /_/ / /_/  __/
-- /_/_/ /_/_/\__/_/\__,_/\__/\___/
--

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.conf",
	command = "setfiletype conf",
})

vim.opt.mousemodel = "extend"

vim.api.nvim_create_user_command("BuildPreview", function()
	local filename = vim.fn.bufname()
	local path = vim.fn.fnamemodify(filename, ":h")

	if vim.fn.system("pgrep --full retype") ~= "" then
		vim.fn.system("pgrep --full retype | xargs kill")
	end

	if filename:match("^.+/(.+)$") == "retype.yml" then
		if vim.fn.getcwd() ~= path then
			vim.fn.chdir(path)
		end

		if vim.fn.system("pgrep --full retype") == "" then
			vim.api.nvim_command("!retype watch & disown")
		end
	end
end, {})
