-- ~/.config/nvim/lua/forge/plugins/init.lua
--
-- This file is the central manifest for all plugins.
-- It loads the default plugins and then intelligently merges any user-defined
-- overrides from `forge.config`. This ensures user configuration is respected.

-- Define the default list of plugins for NvShade.
local default_plugins = {
  -- The foundational plugins that provide the look and feel of NvShade.
  require("forge.plugins.theme"),
  require("forge.plugins.ui"),

  -- Core functionality
  require("forge.plugins.telescope"),
  require("forge.plugins.treesitter"),
  require("forge.plugins.comment"),
  require("forge.plugins.autopairs"),

  -- Git integration
  require("forge.plugins.gitsigns"),
  require("forge.plugins.lazygit"),

  -- Discoverability
  require("forge.plugins.which-key"),

  -- LSP & Tools Installer
  require("forge.plugins.mason"),

  -- Completion Engine
  require("forge.plugins.cmp"),

  -- Snippet Engine
  require("forge.plugins.luasnip"),

  -- Dashboard
  require("forge.plugins.alpha"),

  -- File Explorer
  require("forge.plugins.nvim-tree"),

  -- Bufferline
  require("forge.plugins.bufferline"),
}

-- Safely attempt to load the user's custom configuration.
-- `pcall` prevents errors if the file doesn't exist.
local status_ok, user_config = pcall(require, "forge.config")
if not status_ok then
  -- If there's no user config, just return the defaults. This is perfectly fine.
  return default_plugins
end

-- If user config exists, merge its plugins into the default list.
-- We iterate through the user's plugin list and append each entry to our default list.
-- lazy.nvim will then process the final, combined list and automatically handle
-- overriding `opts`, `enabled`, etc., for any plugins defined in both places.
if user_config and user_config.plugins then
  for _, plugin_spec in ipairs(user_config.plugins) do
    table.insert(default_plugins, plugin_spec)
  end
end

-- Return the final, merged list of plugins to lazy.nvim.
return default_plugins
