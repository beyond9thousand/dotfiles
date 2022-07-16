-- n, v, i, t = mode names

local M = {}

M.lspconfig = {
   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

   n = {
      ["<leader>pp"] = {
         function()
            vim.lsp.buf.formatting_sync()
         end,
         "format",
      },
   },
}

return M
