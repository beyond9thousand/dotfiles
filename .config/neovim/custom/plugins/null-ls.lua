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
	b.formatting.beautysh.with({
    filetypes = { "zsh" },
  }),
	b.formatting.stylua,
	b.formatting.prettier,
	b.formatting.shellharden,
	b.formatting.black,
	b.diagnostics.markdownlint.with({
		extra_args = { "--disable MD002 MD006" },
	}),
	b.diagnostics.zsh,
	b.diagnostics.flake8,
	b.diagnostics.mypy,
	b.diagnostics.stylint,
}

local M = {}

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,

		-- format with keymap
		on_attach = function(client)
			if client.supports_method("textDocument/formatting") then
				vim.keymap.set(
					"n",
					"<space>fm",
					vim.schedule_wrap(function()
						vim.lsp.buf.format()
					end),
					{ desc = "lsp formatting" }
				)
			end
		end,
	})
end

return M
