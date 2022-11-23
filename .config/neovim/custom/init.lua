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

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		table.foreachi(_G.RETYPE_JOBS or {}, function(_, job)
			-- job:shutdown()
			vim.loop.kill(job.pid)
		end)
	end,
	pattern = "*retype.yml",
	desc = "Kill all retype jobs.",
})

vim.api.nvim_create_user_command("RetypeWatch", function()
	if _G.RETYPE_JOBS then
		local SIGKILL = 9
		table.foreachi(_G.RETYPE_JOBS, function(_, job)
			job:shutdown()
			vim.loop.kill(job.pid, SIGKILL)
		end)
		_G.RETYPE_JOBS = nil
		return
	end

	local path = vim.fn.bufname()
	if vim.fn.fnamemodify(path, ":t") == "retype.yml" then
		local retype = require("plenary.job"):new({
			"retype",
			"watch",
			cwd = vim.fn.fnamemodify(path, ":h"),
		})
		retype:start()
		_G.RETYPE_JOBS = _G.RETYPE_JOBS and table.insert(_G.RETYPE_JOBS, retype) or { retype }
	end
end, {})

-- usercmd("RetypeWatch", function()
-- 	local filename = vim.fn.bufname()
-- 	local path = vim.fn.fnamemodify(filename, ":h")
--
-- 	if vim.fn.system("pgrep --full retype") ~= "" then
-- 		vim.fn.system("pgrep --full retype | xargs kill")
-- 		vim.notify("killing retype")
-- 	end
--
-- 	if filename:match("^.+/(.+)$") == "retype.yml" then
-- 		if vim.fn.getcwd() ~= path then
-- 			vim.fn.chdir(path)
-- 			vim.notify("changing cwd")
-- 		else
-- 			vim.notify("proceeding normally")
-- 		end
--
-- 		if vim.fn.system("pgrep --full retype") == "" then
-- 			vim.api.nvim_command("!retype watch & disown")
-- 			vim.notify("starting retype")
-- 		end
-- 	end
-- end, {})
