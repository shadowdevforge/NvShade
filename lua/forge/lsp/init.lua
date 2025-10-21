-- ~/.config/nvim/lua/forge/lsp/init.lua
-- This file contains global settings for Neovim's LSP client and diagnostics.

-- Configure diagnostic signs
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Add a border to the hover window for a nicer look.
-- This is the modern, non-monkey-patching way to do this.
local lsp_handler = function(err, result, ctx, config)
  config = config or {}
  config.border = config.border or "rounded"
  vim.lsp.handlers.hover(err, result, ctx, config)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(lsp_handler)
