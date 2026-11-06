-- Utility functions for Neovim config
local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

function M.autocmd(event, pattern, callback, opts)
  local options = { group = M.augroup(opts.group or "custom") }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_create_autocmd(event, vim.tbl_extend("force", { pattern = pattern, callback = callback }, options))
end

return M