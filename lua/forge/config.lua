-- ~/.config/nvim/lua/forge/config.lua
--
-- This is your personal configuration file for NvShade.
--
-- Any value you return in this table will override the default settings.
-- You can use this to customize NvShade without ever touching the core files.
-- This makes updating NvShade easy, as you can just `git pull` the latest changes
-- without worrying about your personal settings being overwritten.
--
-- For a list of all possible options, check the NvShade documentation.

local M = {}

-- =============================================================================
-- Theme Configuration
-- =============================================================================
-- Available Nightfox themes: nightfox, dayfox, dawnfox, duskfox, carbonfox, terafox
-- Example: Change the colorscheme
-- M.theme = "carbonfox"

-- Example: Enable a transparent background
--M.transparent_bg = true

-- =============================================================================
-- Plugin Configuration Overrides
-- =============================================================================
-- The `plugins` key should be a table where each key is the name of a plugin
-- and the value is a function that will be called with the plugin's default options.
M.plugins = {
  -- Example: Override Telescope's default layout
  -- ["telescope.nvim"] = function(opts)
  --   opts.defaults.layout_strategy = "vertical"
  --   return opts
  -- end,

  -- Example: Add a new plugin that is not included in NvShade by default.
  -- Make sure to run `:Lazy sync` after adding a new plugin.
  -- ["github/copilot.vim"] = {
  --   -- lazy.nvim options for this plugin go here
  --   event = "InsertEnter",
  -- },
}

-- =============================================================================
-- LSP Server Configuration Overrides
-- =============================================================================
-- The `lsp` key should be a table where each key is the name of an LSP server
-- and the value is a function that will be called with the server's default options.
M.lsp = {
  -- Example: Disable format-on-save for the Python LSP server
  --   ["pyright"] = function(opts)
  --   opts.on_attach = function(client, bufnr)
  --     -- Call the default on_attach function to keep existing keymaps
  --     require("forge.plugins.mason").on_attach(client, bufnr)
  --
  --     -- Disable formatting for this server
  --     client.server_capabilities.documentFormattingProvider = false
  --   end
  --   return opts
  -- end,

  -- Example: Customize Python type checking behavior
  -- ["pyright"] = function(opts)
  --   opts.settings = {
  --     python = {
  --       analysis = {
  --         typeCheckingMode = "strict",
  --         autoImportCompletions = true,
  --       }
  --     }
  --   }
  --   return opts
  -- end,
}

-- =============================================================================
-- Safe Configuration Access Functions (Not for customization!)
-- =============================================================================
-- These functions provide safe access to configuration values with proper
-- fallbacks and error handling. Plugin files should use these functions
-- instead of directly accessing M.* values.

-- General configuration getter with fallback support
-- Usage: config.get("theme", "duskfox")
function M.get(key, default)
  local success, value = pcall(function()
    return M[key]
  end)

  if success and value ~= nil then
    return value
  else
    return default
  end
end

-- Theme getter with validation against known Nightfox themes
-- This ensures only valid themes are applied, with automatic fallback
-- Usage: local theme = config.get_theme()
function M.get_theme()
  local valid_themes = {
    "nightfox", "dayfox", "dawnfox", 
    "duskfox", "carbonfox", "terafox"
  }
  
  local theme = M.get("theme", "duskfox")
  
  -- Validate theme exists in nightfox collection
  for _, valid_theme in ipairs(valid_themes) do
    if theme == valid_theme then
      return theme
    end
  end
  
  -- If invalid theme specified, warn user and fallback to default
  vim.notify("Invalid theme '" .. tostring(theme) .. "', falling back to duskfox", vim.log.levels.WARN)
  return "duskfox"
end

-- Transparent background configuration getter
-- Returns boolean value for transparent background setting
-- Usage: local transparent = config.get_transparent()
function M.get_transparent()
  return M.get("transparent_bg", false)
end

-- Plugin configuration getter
-- Returns the configuration function/table for a specific plugin
-- Usage: local plugin_config = config.get_plugin_config("telescope.nvim")
function M.get_plugin_config(plugin_name)
  local plugins = M.get("plugins", {})
  return plugins[plugin_name]
end

-- LSP server configuration getter
-- Returns the configuration function for a specific LSP server
-- Usage: local lsp_config = config.get_lsp_config("pyright")
function M.get_lsp_config(server_name)
  local lsp = M.get("lsp", {})
  return lsp[server_name]
end

-- =============================================================================
-- Configuration Validation
-- =============================================================================

-- Validate plugin configurations
local function validate_plugins()
  local plugins = M.get("plugins", {})
  for plugin_name, plugin_config in pairs(plugins) do
    if type(plugin_config) ~= "table" and type(plugin_config) ~= "function" then
      vim.notify("Invalid plugin config for '" .. plugin_name .. "': expected table or function", vim.log.levels.ERROR)
    end
  end
end

-- Validate LSP configurations
local function validate_lsp()
  local lsp = M.get("lsp", {})
  for server_name, server_config in pairs(lsp) do
    if type(server_config) ~= "function" then
      vim.notify("Invalid LSP config for '" .. server_name .. "': expected function", vim.log.levels.ERROR)
    end
  end
end

-- Run validation on module load (optional - remove if you prefer silent failures)
-- validate_plugins()
-- validate_lsp()

return M
