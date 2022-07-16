function format_checked(active_client)
   if active_client.supports_method "textDocument/formatting" then
      vim.lsp.buf.formatting_sync({}, 3000)
   end
end

function toggle_auto_save()
   if #vim.lsp.get_active_clients() == 0 then
      vim.api.nvim_notify("No LSP clients are attatched!", vim.log.levels.WARN, {
         icon = "",
         title = "LSP",
      })
      return
   end

   if not _G.auto_format_state then
      _G.auto_format_state = vim.api.nvim_create_autocmd("BufWritePost", {
         callback = vim.schedule_wrap(function()
            format_checked(vim.lsp.get_active_clients()[1])
         end),
      })
      vim.api.nvim_notify("Autosave is ON.", vim.log.levels.INFO, {
         icon = "",
         title = "LSP",
      })
   else
      vim.api.nvim_del_autocmd(_G.auto_format_state)
      _G.auto_format_state = nil
      vim.api.nvim_notify("Autosave is OFF.", vim.log.levels.INFO, {
         icon = "",
         title = "LSP",
      })
   end
end

vim.api.nvim_create_user_command("ToggleAutoSave", toggle_auto_save, {})
