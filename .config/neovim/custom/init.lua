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

vim.api.nvim_create_user_command("HtmlPreviewToggle", function(items)
	local path = vim.fn.fnamemodify(items.args, ":p:h")
	vim.fn.chdir(path)

	if vim.fn.system("pgrep --full live-server") == "" then
		vim.api.nvim_command("!live-server --quiet & disown")
	else
		vim.fn.system("pgrep --full live-server | xargs kill")
	end
end, {
	complete = "file",
	desc = "Please.",
	nargs = "?",
})
