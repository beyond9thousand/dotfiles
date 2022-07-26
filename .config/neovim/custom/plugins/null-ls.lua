--     __
--    / /___ _____  ____ ___  ______ _____ ____
--   / / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \
--  / / /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __/
-- /_/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/
--               /____/            /____/
--

local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.shfmt,
	b.formatting.stylua,
	b.formatting.prettier,
	b.formatting.shellharden,
	b.formatting.black,
	b.diagnostics.markdownlint.with({
		extra_args = { "--disable MD002 MD006" },
	}),
	b.diagnostics.shellcheck,
	b.diagnostics.flake8,
	b.diagnostics.mypy,
	b.code_actions.shellcheck,
}

local M = {}

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,

		-- format with keymap
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.keymap.set(
					"n",
					"<space>fm",
					vim.schedule_wrap(function()
						vim.lsp.buf.formatting_sync()
					end),
					{ desc = "   lsp formatting" }
				)
			end
		end,
	})
end

return M
