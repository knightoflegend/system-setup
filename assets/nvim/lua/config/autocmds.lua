-- Auto commands
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.start_client(vim.lsp.get_active_clients()[1] or {})
  end
})