-- ~/.config/nvim/lua/forge/config.lua
-- This is your personal configuration file for NvShade.
-- Any plugins defined here will be merged with or added to the core plugins.

local M = {}

-- =============================================================================
-- Plugin Configuration
-- =============================================================================
-- The main plugins table for adding/overriding plugins.
M.plugins = {
  -- -- Example: Override telescope options
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = {
  --     defaults = {
  --       layout_strategy = "vertical",
  --     },
  --   },
  -- },
  --
  -- -- Example: Disable a default plugin
  -- { "goolord/alpha-nvim", enabled = false },
  --
  -- -- Example: Add a new plugin
  -- {
  --   "github/copilot.vim",
  --   event = "InsertEnter",
  -- },
}

return M
